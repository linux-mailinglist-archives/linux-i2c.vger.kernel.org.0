Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E618A1A92AC
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Apr 2020 07:48:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437664AbgDOFsP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Apr 2020 01:48:15 -0400
Received: from mout.web.de ([212.227.17.12]:40261 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2437642AbgDOFsM (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 15 Apr 2020 01:48:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1586929664;
        bh=EGRrqjDzjgYsKTv/Rw9IDdvJHm728m4ptunQNzBGAE8=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=j7x1xdtEyA2o3TgHvQVmWyxEpObdAMknQeB54BRRlzzHvA5Rb2nABjHRavZ/b38XB
         D/YFypDvvrfw9Xsub9Dlbq5C8lOQMrry1QHVYx7RmKbailOWt5esMdQAXAO5/PFhnQ
         7Nck0J0GOXhXk7gLRN1T78bOikpCRF22hD8xBUhs=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.3] ([78.48.133.192]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MdLwN-1jfzSV1YJf-00IUQP; Wed, 15
 Apr 2020 07:47:44 +0200
Subject: Re: i2c: img-scb: remove duplicate dev_err()
To:     Dejin Zheng <zhengdejin5@gmail.com>, linux-i2c@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Allison Randal <allison@lohutok.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Patrice Chotard <patrice.chotard@st.com>,
        Shah Nehal-Bakulchandra <Nehal-bakulchandra.Shah@amd.com>,
        Tang Bin <tangbin@cmss.chinamobile.com>,
        Thomas Gleixner <tglx@linutronix.de>
References: <08564c03-3bbd-5518-1a9d-a40b8ca09f48@web.de>
 <20200415025426.GB14300@nuc8i5>
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <b5db65f5-f236-9e22-98df-07629a827738@web.de>
Date:   Wed, 15 Apr 2020 07:47:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200415025426.GB14300@nuc8i5>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:f1enqzOdPYZu7Wh7o48rc8ZyVmctipcbKqLF+ka6mzQIlyyf4NI
 5Irjsw8YZCEn7odMklF/1pv04ku4MwxYjdUvni7N7XbuWvDF7IItA/2qpQs671TY2rqk7cf
 +sRJlu1hxXJOsV9+M9ceUDT1YQnL8jjh2fRliI52ndzI2EDhEIGkonHQKHUe1j2tU89tL4U
 FxidQMtR45hsyElscOn0g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:1yVimnkl7pA=:bezFH0tHkXHAMZJ/Jdt6La
 H/+q4zAlHsIRRYXywCmXNaN4AneO0bEf36r4+pcCqu3DiDKSutjGdBYUGd/Q2p/cPYAT9TOeq
 bq1gr5uco9DBiGPFVoQRS7XMsFQupTMyIpVAWD+rNriAPJfsUGE0nxb4KWIqABuSqlJir8FiW
 E1ezAz80RLh1ohIhSHwPekb3IrzgqU+QlH/uziJEGTKjDGy1jUfN5oojeJSnc2qT8OIv7BsyT
 fG2IG4HMLgE8GRYeDvqsUTzYXDrOeLZ11hB6Q9aqDAwjROHDr1IIZEDHh/7yOMIQPS4TXEqyt
 uYPdOJcQtzMrACBPtCU0Ntfi0FPU7hHkz3jGi1gWpdJ6u740j/1+3OpbJuzuH8PmDT5SkzcUW
 PaT6lpd2U3jNx2g1+scPdexytw8Tx5sF8G1AmgsI1nrRjbu+oAF75Nw1eaOrt6mh8uDLnmklH
 wYD0bKpXl4w1P7BmLeSxBWXPsBy9mI5NABjbmfh0YWJ4dgdv7ElLxjEuM/cAdL5U538INkrf5
 gdn4PykLGKQZhILXkuO03ZNGTYK7BdQ15M45/kU7YeODfQtHo6LUn5VWhpetehVb2H0mTYix9
 7s0ZtBbFAZ442NSPy3/5Z0b+/jDNmUcnbYDPnLn3lVtLsCfKlldEa0qD1chZnksX8sr5THN1U
 KXTitQC1Qe3f/kMZnClGdtbPXlfahhLfpYSugLmxt8yp9eelOr2L77X7cVPFY/Jsl4boa5Jsi
 sDBzU24+t35VzijSgKPWpoGLUQX+LPN0yfkHbgiJh99ZeQ79XM1GpT6+fPVlXpPYzw5VhlXeC
 qGliV1YWTIJOf4elxDCaeFnhdEVFGArHuMYD+UtS4WMBhLS9qhyruuRlwv/cMAFYja+J6CMZC
 ktORiZ5rw0hgW+OeUUyyu+WNzygGqXiXfghp9vET5tZwdgcMhlsmXDmYKmjoXiE951uX9hCHf
 pOc34SakHqFFNyBjRy0+ndn7ef0STQP8BD24ftgFS3xd7A5SBGJ08v2XU0w0UG1mJNfls+jHm
 VFXKFguyD089S/24kZ6pbwCreAOHtKH+3JamBWpI1KDHFykQYzF2My3XyFL/OxN8dQjoSvi8R
 HJYztbfJ09ZWa1IuzvqU39I5GAUtvp+3KYL21qo1CJ1IzA1mUFtCa07Xn5pLOvxIPwIyvP0a7
 Rx0ntBF1Wt3+Lm+jjh0Xx0aIywrBcGc4YJo/gM+uw23f6CMDmWuygBtnN2Oso3VX/EgbaWbKL
 FAaDczdt24b38xd6L
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> Thanks for your comments, and maybe we can use coccinelle tools for
> more source files do this change in the mentioned software area.

I found 19 source files (for example in the directory =E2=80=9Cdrivers/i2c=
=E2=80=9D
of the software =E2=80=9CLinux next-20200408=E2=80=9D) which seem to conta=
in similar
update candidates according to a known transformation pattern.
Would you like to take another look at corresponding change possibilities?

Regards,
Markus
