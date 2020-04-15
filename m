Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 337481AADF7
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Apr 2020 18:32:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1415739AbgDOQYs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Apr 2020 12:24:48 -0400
Received: from mout.web.de ([212.227.17.12]:40799 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1415722AbgDOQYo (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 15 Apr 2020 12:24:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1586967853;
        bh=2inyYnjLhj6qwd1up7zok8Cwr0UHasz4eO509tyVi/g=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=V1xr2I7IQ9IBTkmy3dg1Nbp7lLH5xQImvA9wKitE3MyGs5/SDKQaF3Ju6r7JEVZpk
         VeamoM5QQxuVCfAjB7OEBpVr7aajymrM2HXLawhkNG8kxFqPmHl84yj60s1FBdmwVF
         iS0IGoKMsTFXB5rhQ96SoWdNNcZYcNz5fFpEVNGQ=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.3] ([78.48.133.192]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0Lrazp-1jGxJB3EJp-013J7y; Wed, 15
 Apr 2020 18:24:12 +0200
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
 <20200415025426.GB14300@nuc8i5> <b5db65f5-f236-9e22-98df-07629a827738@web.de>
 <20200415152115.GA17519@nuc8i5>
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <668fe4da-56f2-8abe-1113-fa180f307524@web.de>
Date:   Wed, 15 Apr 2020 18:24:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200415152115.GA17519@nuc8i5>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Provags-ID: V03:K1:4qm1IgV9WlIFCqlY5G6sIuOCK4HGeHmwNGVHRaodgPaB1T910Zc
 Y52+cN6dEKBQN+xI1HYJi2mIqoIqYgM3t6+buxZoj4DiPABDl0wBDrfsO75Yq+zbKINBx4N
 6kNAvTQzDIhTVIA0SCHvSfNuJ7QX8CCju9OLF3sW7006QWqjkNB8tlHJIFSwsHflMYCiCuz
 E5R2CT37yNkWdAtd836Sw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:M08wNIoUca8=:Jyyk8Lc7wUCFuRCED6XgL6
 h9fvFRgWA0zkuZABimOjV/KClE+7TumYjz3z5opHr1zlcfqfgGWgOvqzY6LGdLUf0uTLqt5Jm
 wSPkyzrr3niRCh609ASWmr1tyXp0Bav+tf1sWsj5C0wf48CCBu6AB5qqM4fnNl3YEejxrJQE4
 hvazFv5HPCyyJV5E2zrLTNjoGJD92IY4Wc/9P0idA6LSuARCRfgXk0TjScq/MzumhS8roMCFP
 UWiFoCy3crryoykwAabhiT8dJD8Bt1UXG03lTNrdnE18bngR048Xiqt4PFkZib1YyvsU3HyI2
 MJWNOajg1CrVp93w3TqChI6muZvT8rRoCWv7TZzPGTNWzSVcgXqR+9/xdpEP0cxPl9s4FTAHo
 nlwxNlUUJOMMxjqa1NSkwKkVtrw14wmfYe9Lvj06EDYRPqwEDa0jPt6/r9KZ8z2e/5xQ3SOt4
 BNRmh29DbBJX4yDWTIB43aPCZkKS+yD4l1MiSlRY4SgxsXLBrNH4n9YND8mEzjV56EDEzA5L4
 XaRUKg62fEQiXaCuiTIpMHw2XZK5QeB5134aqLto+cn6nNpWqSGN2uUUyBDAJmhxMI5RgMdG8
 UjNBKk4Cs4N8qaBwf7vXs/Fc9mB506iAUtJq5x6Xmanq4EG94dM5lmZ7o72iXqPsWm79JHMOJ
 ejYLeaOqUt2J1KfVTdoxnSK6YrK1/cjJve1bRdLTkv8P8+x/lIF7mOhWxgkGmeJUPsISg7xsA
 gswi6ImUaX2zCd24hH02Rys4xme9DETBWlcYr2wyHnzI6QR4T38waPCNxCu7X0cMW0X7WAcqA
 SMAis3W9GYsfcFNpOlUqgUa+kE9sP8/U/UZLR/ul8v9fW46X0LLbit1CTisPkBV2Rf7YnMkx1
 LYh7UI1AGwGvgpocb+BeMZnpytNnhLAdh0nQB4H88BLgFR066HWMwCrRKqEOCyOtAf9juH1kF
 m38YN5sXmbPny5r/PQ639kpexC+zUnSLejPDpJXuHW2A/978E6pbd99cnZ+MsCrFhI2A7TipX
 H59ZkveESN5E17zJa6beR67FEmH8NjztkUKPet1RiynYc0JBAHOCdUL/bKqwMMsuZJdW9+qJF
 3AS8KeSnj9m295Y5fSjV/d8agzRRRIejx0iKWVOg3PyIq1AA9mJgylUA1SSGLFf5bcBM2qFIy
 586GSX5QFiYt6n4TZjUo54brAapGc+82sGWfS2ufZjely1M5nto4/IM9w/aO19Rw//cx9kmgO
 BSpijHkjvAyJQ9nUx
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

>> Would you like to take another look at corresponding change possibilities?
>>
> yes, I want to do it and thanks for your info.

This positive feedback can lead to corresponding software development opportunities.
Which directions would you like try out next?

Regards,
Markus
