Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 934A7400011
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Sep 2021 14:58:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234740AbhICM7Z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 Sep 2021 08:59:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231639AbhICM7Y (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 3 Sep 2021 08:59:24 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6215C061575
        for <linux-i2c@vger.kernel.org>; Fri,  3 Sep 2021 05:58:24 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id h9so11934914ejs.4
        for <linux-i2c@vger.kernel.org>; Fri, 03 Sep 2021 05:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=WYzSrI9zSNaecML1pdaUth8apEamlGgUMFyc+HnKzhk=;
        b=Ilh7t4xEjHhQwo3noMQhLBg1vnGYtEwj4m7f6VGmLmkhpWv5CU+bT/5TNX6cMJRzxx
         gMPZBMQJGH6iXldeDHlimJGOKdJSvJM8Tz4RtPHlQRM/BSPxzQmOQJ7CZ4XVwqo1XX39
         quszCRN7onkDvFUDbROzm82P0y9KSrSGIhCtiS6cukE8D+gMonDFlRdd2fvKFVx1KXmt
         5pf+JHoZJqjcZpwJ+jhkhd+wqDXgGp1205GQ6OV1li7tH8zh5Di80D/+Bbb1w9p07Md0
         TmbIxsC5Xhd/qBMawmvZS9fCBpB6lyF0OQozemhlGN6NZQUJbHJlOHKIXF7zd3kcRpW/
         y6eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=WYzSrI9zSNaecML1pdaUth8apEamlGgUMFyc+HnKzhk=;
        b=ZoiR6GOJVmr9WA/CxrHAmPqcxAbVN94/udBzQ7uT3AjL9dxwKRtxXthM2R0/whwxjF
         pKhLmozVXTeEvtdTXpZJw29QImtQ31Z5IYT7c5ScwgrHh9zLkvMXQQIrmThBVLogGZ4v
         1lo4CKY/NNNYX6xG3h+oUWVgWL0C9yEgj+Ezg8byEbIxolAZYj1OkQCbOK18VszcsDf+
         bOaPuAAGY9oWE9/COA9VhQTWtrw7qhACgUTs/LLHmsYqd/l2MNyDioZenDM4SYjm7w1a
         EeYV+xt22PkafDlbhXuOCyVG5nk6hLLbUkERjeyi3St7/NM+Bb+2VqJ70deROaM58N97
         H5KQ==
X-Gm-Message-State: AOAM530SCzpMrH/wD0IdwmWhkB7vWLaxy7CM0PqcHpnFG3rXiQv/1HVY
        nHQI1nesfhSXLjaSRFH18ie9I0YU6gdzJdcGGX4=
X-Google-Smtp-Source: ABdhPJzyNiTR58o+MSntwQms5f7ZaOQz+XUNzy4+aUr7N6LLaAMyYLX2YqZdmiMbx+rlsCWvbTanwRnfVeT4UpFPQMY=
X-Received: by 2002:a17:906:184e:: with SMTP id w14mr4012833eje.526.1630673903161;
 Fri, 03 Sep 2021 05:58:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:906:c288:0:0:0:0 with HTTP; Fri, 3 Sep 2021 05:58:22
 -0700 (PDT)
Reply-To: michaelrachid7@gmail.com
From:   Michael Rachid <sammyhamidou93@gmail.com>
Date:   Fri, 3 Sep 2021 13:58:22 +0100
Message-ID: <CAOO_Zf98hzdT+hyqg6T-jm=K5WvTdDbswq_apMThEde2QeyEww@mail.gmail.com>
Subject: =?UTF-8?B?UHJvcG9zYWwv4Kaq4KeN4Kaw4Ka44KeN4Kak4Ka+4KasIFByYXN0xIFiYQ==?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

4Kaq4KeN4Kaw4Ka/4Kav4Ka8IOCmrOCmqOCnjeCmp+CngSwNCg0K4KaG4Kau4Ka/IOCmj+CmleCm
n+CmvyDgpqzgp43gpq/gpqzgprjgpr7gpq/gprzgpr/gppUg4Kaq4KeN4Kaw4Ka44KeN4Kak4Ka+
4KasIOCmuOCmruCnjeCmquCmsOCnjeCmleCnhyDgpobgpqrgpqjgpr7gppXgp4cg4KaF4Kas4Ka5
4Ka/4KakIOCmleCmsOCmvuCmsCDgppzgpqjgp43gpq8g4Kay4Ka/4KaW4Kab4Ka/IOCmr+Cmvg0K
4KaG4Kau4Ka/IOCmhuCmquCmqOCmvuCmsCDgprjgpr7gpqXgp4cg4Kaq4Kaw4Ka/4Kaa4Ka+4Kay
4Kao4Ka+IOCmleCmsOCmpOCnhyDgpprgpr7gpofgpaQNCuCmquCmnuCnjeCmmuCmvuCmtiDgpq7g
pr/gprLgpr/gpq/gprzgpqgg4Kah4Kay4Ka+4KawIOCmnOCmoeCmvOCmv+CmpOClpCDgpqjgpr/g
prbgp43gpprgpr/gpqjgp43gpqQg4Kal4Ka+4KaV4KeB4KaoIOCmr+CnhyDgprjgpqzgppXgpr/g
ppvgp4Eg4KaG4KaH4Kao4Ka/IOCmj+CmrOCmgiDgpp3gp4HgpoHgppXgpr/gpq7gp4HgppXgp43g
pqTgpaQNCuCmpuCmr+CmvOCmviDgppXgprDgp4cg4KaG4Kaq4Kao4Ka+4KawIOCmhuCml+CnjeCm
sOCmuSDgpqjgpr/gprDgp43gpqbgp4fgprYg4KaV4Kaw4KeB4Kao4KWkDQoNCuCmruCmvuCmh+Cm
leCnh+CmsiDgprDgpr7gpprgpr/gpqHgpaQNClByaeG6j2EgYmFuZGh1LA0KDQrEgW1pIMSTa2Hh
ua1pIGJ5YWJhc8SB4bqPaWthIHByYXN0xIFiYSBzYW1wYXJrxJMgxIFwYW7EgWvEkyBhYmFoaXRh
IGthcsSBcmEgamFuJ3lhDQpsaWtoYWNoaSB5xIEgxIFtaSDEgXBhbsSBcmEgc8SBdGjEkyBwYXJp
Y8SBbGFuxIEga2FyYXTEkyBjxIEnaS4NClBhw7FjxIHFm2EgbWlsaeG6j2FuYSDhuI1hbMSBcmEg
amHhuZtpdGEuIE5pxZtjaW50YSB0aMSBa3VuYSB5xJMgc2FiYWtpY2h1IMSBJ2luaQ0KxJNiYeG5
gSBqaHVtzJBraW11a3RhLg0KRGHhuo/EgSBrYXLEkyDEgXBhbsSBcmEgxIFncmFoYSBuaXJkxJPF
m2Ega2FydW5hLg0KDQpNxIEnaWvEk2xhIHLEgWNp4biNYS4NCg0KDQpEZWFyIGZyaWVuZCwNCg0K
SSB3cml0ZSB0byBpbmZvcm0geW91IGFib3V0IGEgYnVzaW5lc3MgcHJvcG9zYWwgSSBoYXZlIHdo
aWNoIEkgd291bGQNCmxpa2UgdG8gaGFuZGxlIHdpdGggeW91Lg0KRmlmdHkgbWlsbGlvbiBkb2xs
YXJzIGlzIGludm9sdmVkLiBCZSByZXN0IGFzc3VyZWQgdGhhdCBldmVyeXRoaW5nIGlzDQpsZWdh
bCBhbmQgcmlzayBmcmVlLg0KS2luZGx5IGluZGljYXRlIHlvdXIgaW50ZXJlc3QuDQoNCk1pY2hh
ZWwgUmFjaGlkLg0K
