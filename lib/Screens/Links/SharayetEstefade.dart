import 'package:flutter/material.dart';
import 'package:salinam/constants/colors.dart';

class Sharayet extends StatelessWidget {
  const Sharayet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.backgroundScreenColor,
        centerTitle: true,
        title: const Text('حریم شخصی'),
      ),
      body: const SafeArea(
          child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(44, 20, 44, 80),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: const Text(
                  'قوانین و شرایط استفاده از اپلیکیشن سالینام \nافتخار ماست که شما اپلیکیشن سالینام را انتخاب نموده‌اید\n هر فرد می‌تواند با یک سیم کارت و آدرس ایمیل دارای یک حساب کاربری باشد.\n اپلیکیشن سالینام هیچ دخالت و تصرفی جهت دسترسی ، انتقال ، تغییر یا حذف محتوا یا محدودسازی دسترسی کاربر به اطلاعات خصوصی را ندارد و هیچگونه پالایشی در اطلاعات تبادل‌شده خصوصی انجام نمی‌دهد.\n جمع آوری و استفاده از اطلاعات\n در استفاده از خدمات اپلیکیشن سالینام ، ما برخی از اطلاعات شما را که توسط خودتان وارد شده است را جمع‌آوری و برای تایید برخی از خدمات از آنها استفاده می‌کنیم. نکته مهم این که، ما فقط اطلاعاتی را جمع آوری می‌کنیم که برای استفاده از خدمات ضروری می دانیم.\n مجوز\n لیست مجوزهای درخواستی در اپلیکیشن سالینام که در هنگام نصب از شما درخواست خواهد شد .\n پیام ، Sms / Notification \n به منظور ارسال پیام سفارشات ، اطلاع رسانی ، تاییدیه ورود\n امنیت و  Security\n اطلاعات شما در سرورهای امن ما نگهداری می‌شود و ما از این داده‌ها به عنوان دارایی‌های که باید حداکثر حفاظت از آنها وجود داشته باشد ، محافظت خواهیم کرد.\n  Data Log\n هنگامی که از خدمات اپلیکیشن ما استفاده می‌کنید نیاز است که در صورت بروز خطا برخی از اطلاعات رخدادها (Log Data) را جمع آوری و برای رفع مشکل اقدام کنیم. این اطلاعات ارسالی شامل Device İD, Device OS version, Device Model, user İP و زمان و تاریخ رخداد و دیگر موارد مربوط به سرویس می‌شود.\n Public Information \n با توجه به گسترش خدمات ممکن است محتوای مربوط به خط مشی و حریم خصوصی را به روز رسانی کنیم. این اقدام بلافاصله در این صفحه اطلاع رسانی خواهد شد.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontFamily: 'irykndb'),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
