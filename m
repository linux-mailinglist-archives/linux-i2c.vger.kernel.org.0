Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26665B553C
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Sep 2019 20:22:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729061AbfIQSWb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Sep 2019 14:22:31 -0400
Received: from mout.web.de ([212.227.17.12]:53957 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729034AbfIQSWa (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 17 Sep 2019 14:22:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1568744543;
        bh=3KtLuje3xRwF06zwMpWBQiuvQ1uXOQaTbtUWTa09JWM=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=BC0PmQd5iyH4TsziCe41FK7sOl6Iy/e5ui1bfOvkXabsd4dPUOnosuFJKl2NzrSEY
         KBMsaK2g8dWEPqBkEGrFpLF2Unaj1520HMFZWns0c0Lsa/D7AiseQT6rse3ioETELY
         YtN09BiKEwAO8Bwyryy9B/XRgjg7nMpvKX4EmgaY=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.244.93.51]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MTPn1-1ic66y2NGx-00SLoa; Tue, 17
 Sep 2019 20:22:23 +0200
Subject: Re: [v2 0/3] Fix issues reported by Coccinelle
To:     Wolfram Sang <wsa@the-dreams.de>,
        Saiyam Doshi <saiyamdoshi.in@gmail.com>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190917172758.GA11926@SD>
 <76e99512-8818-cec2-9e77-799e4c8481ab@web.de>
 <20190917181423.GB28182@ninjato>
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <0f2c34f5-7656-9a6f-7f86-6dd58c8f6ef7@web.de>
Date:   Tue, 17 Sep 2019 20:22:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20190917181423.GB28182@ninjato>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:EW/XeY9KIbIqyxrM+kVd1BlWAb5Mq4VpZ6y1diuUXVf04g43xRx
 bZPYwmVyhMaGi6aaHRQn+9LtLsVnLb7SRUSJKAn+4Piugp+TS2Tw8BfsYzx+2JT6+rwtJE5
 Bfa7GJlOlsrzJvb2bAaVn0eS1j+PyafXgkrm8QO/hepj1BxxlZNMsE5cb1u8bPdV2yuztbp
 U0al0CrLpB926QfWEa2FQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:IKfYRuz/csE=:6VIqOxo1Aj2kuTHxERxUVT
 krOZlhLDjzE8r1EM9c+ObpHkjl6jRBmqoOwPyyshySazkrHjNsQmKq+QmWKvz/Db52WzUIo4e
 A5WIk6IML65+GFx9/UWIT8qufApfi52KOqIva79pCGSpHcbp9FcGGx0M7uk3EbFI4A74t7H9l
 vK+fYeu64TozwqaPWjgkIGvVDOUpP77B+dx/nlyqFC5gUQdR7gEJqoQCScRtHYaEVhrtR/4K/
 uy4yPCSQORqA0bDtMlnCeQvwqDUb/6NzZpONjxXO0jTDdNdYxU7icuDEgdKSAy65wFmJCjthd
 S9hPMAJZJlEF+OAQCAxI7X/QsBRzj2Mk17yolt+sXKajc2OtxMT3H4stMlGICqgAAJ+jy2FH9
 bp+Na5tpjwm3KXIxOEC6dmN+qu2G+0w+IjR79JzOMNun9pV9sSICbygelLZGNdZBEHB7DQznY
 /JZYnt+oo9JPZ6jXbO7JDJnrV6BE2hx0ZQK3/zg7rjbdh7aETUbwyOST4DbkJM11UEGNeOm3u
 sHj5HFkD0K97xDDsa3tuvysqGQsQOZw/qQ64o8MYwR4jAjMTGVVbVhYKjSs4dbe2CKykXePc7
 kUKKxFysAsf7LXZYCTS9kQWpeo0LFnZ53Fa6p0C57zi8CUl2JzOw4GKTbhHImSn8emAL6TrTK
 2JUZNQ9VXVP2FfxHEoTQyhhQLmsULfGmy7gBfbOFl8+R7+zQkSBzfYEjQwXKjS1nrfd+Wrows
 64Mb13sSviFgiosHxqkYQM9K1wsWOdPKmgpdAnawR51FUQwUafRmDpT71B3wJ7ZcncX7a45vI
 NJRZLINrpCEh09UvbHnCEOYvG9E32iOJwV7gyUpBXYExcTGoZkn9GP3Nqu1hFgeKZN9aW9xg6
 u+TGREbpX7DSZVNZnKQ9uUBmG1v2I8NWiuEEhjJjqCukXYhyd/VaIUgY50e4NJ7fWu89zko8g
 FjtR9WFew1hPZ7NRyvyRqfhGKD8+kzqBBDCjmRoPCFk6UfB0coCcVSW+bnv1K3LXulvgtmjQV
 zf+w6Q3DubJ3FZxwyu1szm3txNnHDQvuTYp+PvDb/lAVwa4L0yq/7FfDF/lXjGK242GYu5MFB
 +3zhohLilo4CbF+8b49likry6dAgyY06kh9UkLxXsrS3VaIaxz70IPXSLpKM1n7vm5iVJE+ZE
 JTOjm05ing7gttogNmjyZMlg1Bj+Ca47EZP/7HyQQb288pZqcW7IkpR8Hm073wpdl6Sgb+RFU
 hvoL69FT9kTffRMghA8Ix7O7ItlimRQHlfLwvTeNgt4vMI7A5Os9Z+oU3Rdw=
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

>> * I would prefer to refer to a desired reduction of a few
>>   source code quality concerns.
>
> Not needed. I understand what is going on here.

I suggest to reconsider the interpretation of =E2=80=9Censurance=E2=80=9D
after only a few source code places were adjusted.


>>> Changes in =E2=80=A6
>>
>> Can such a prefix be omitted?
>
> Why? I think it makes sense?

Can the specification of a version identifier be occasionally
sufficient already?

Regards,
Markus
