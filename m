Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B45712BD95
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Dec 2019 13:50:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726248AbfL1Mua (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 28 Dec 2019 07:50:30 -0500
Received: from mout.web.de ([217.72.192.78]:55465 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726187AbfL1Mua (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 28 Dec 2019 07:50:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1577537424;
        bh=P/t4loOx1AZXrhxHmvrhi+3XMNCVOGRlEHmFQSjRAb4=;
        h=X-UI-Sender-Class:To:Cc:References:Subject:From:Date:In-Reply-To;
        b=U5S7Vu+wWiZDLURSaw0p68G2/8Jq9Rr9OQleF1lardcC9dCo1q5/RKRLZQHU100Uj
         n7tiaV39bbA6tHRxl8hVfcJycbpoOMgkk+kJtbjjkRIsoWv0pJDrr7mzDDZEyQ1EIg
         9CUTJWP2nnq7DXHLCN464wVGzdddBFIRNlQJc6RE=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([78.48.3.151]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LqDYi-1jOw8u1lBo-00do5g; Sat, 28
 Dec 2019 13:50:24 +0100
To:     Xu Wang <vulab@iscas.ac.cn>, linux-i2c@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>
References: <1577439272-10362-1-git-send-email-vulab@iscas.ac.cn>
Subject: Re: [PATCH 2/2] i2c: Fix a potential use after free
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <81b35c80-74c2-e14e-4947-f23ec6197b73@web.de>
Date:   Sat, 28 Dec 2019 13:50:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <1577439272-10362-1-git-send-email-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Provags-ID: V03:K1:PrlI48dhLIRO4YeSVp6+HSERej6UZEC1VTswfIipTcz1KRENdhI
 UprKZGwX39QOiDTyw/+iAvJ7TdcadlrNykilJhX0Tp40e+WTe+2yilm/ED/DSgcQq1BRBio
 oeHVdbt6rw5E9tl9n09eMwsdDT8rGWDKfZfcYzEZWlCpTWhQeFXoqXymcNRSDkU/TZo3mAw
 lZYJ5yIhlQzeQswMxw8OA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:hrv+lr/SgQ8=:ClWDXTGwdl8Ujwl4Jr7FZA
 l5yO5Q5K0olZ+L3A7TyqQ7/ZpTDZH4AAtjve3fKUpEmFGMKKEiZoMvXvwxw0LbRkSQ+HokVrx
 huECg7bPzrROZ3IGC3KU1kLt+VweIsyQggLuk4oK9Q1QmUxx8QcwrTBpaZ1APe3avDBL/b++9
 gAWmrYZ61HT/o7uqgL1rxRRBiHhV59uz3MISDdAYMdCE5hLalqO2FdChyg38MnehUuM7VgQPy
 4nZqnZRl2ddiO+2Htp/ZPsEqmYfHLgRbwBEjoeOKjpBX3TG/evXYZv9DT3pBgn8By4AUfOEed
 WyV2MCr7MRsflm2iIyEW1U75jSGFsJOBgGOOsIg3fRW6RXnOqX+zViXBIV7HciTQAGBXszOF4
 3JRseR4uG6d4mVGQ1ck2wuDszsTUF+lHOcEVdkDjmshurjd5PnSr2L8aXMMdPG8vI50fRfrq/
 VBSpQQ77itmbdCNjNc+T4hbmb3/PJWFF1UjAQtascDnxmQ+mVoJ7EGRtNGzaavXQsGYKdVJLF
 3NWbkA1xuGDmPvcTDnj9JbO9UaK7ZhKfuDRTmrszHRERzyHC2GeeUlWhHQqdPhAbjOoPVQay6
 MDRnJ/lH7DF2wWattuV8z1E3RrKPMdPvT1GOZgHMLw/b0W7aGC+PG768ot/3k5vJSkvokjJry
 LVXjTpjcij+CF13aEVGjxI2izLGdK6pGN8hFe8rhUii4A7oNlT67swDsHF9IGLh5V5rGcwprP
 prYHa4mk5QzLoVVbdQTU2B+SU1pNwHhtjIJYU7l2kM6o7NoLiYycC0Zo5OROR9ELEP4TaIj7N
 IbYy8W93hR0qWoRxe3p0eKhU9Bh08PWg7oP1XCCgLTXb/hTtclwP9G6azSKuw/8bdosI8+Ap7
 EccfvQS/rbLKRbtvUXx+us4RXz8wqi/7iZH3ChdWk1cLNUiu4dRIlU3ojv8h1NNIwKAfkiODT
 bukJWbi/4JJLsGQ51V2rRphhTZnyE4nWWVgZdl/FOQ5crofV4GcMGzctOo2DYKpPsQc2e7ips
 CXYeFbfULgKHO2d1ctSRT4XuBtmHTQZD7GuxuQ0+4TUZalvui/+H9P0H8fpDsCVRVrV2hAzLF
 qIb7jXOZCCArA37yr8XU4fbyRCRLo5+PXDkhw1eid6xI63vBsBtyjnLHruxmbpxV+Lyp2ZG7e
 iCsaTmXil24tBr7e9gYlns3oRbiNQnJ4Llhc8rOCPneK2C4moMwUUljUQZlBpHn03wkC7Omrm
 yN50Ikpr3k46ecRQsrDk/5dPSTXamnNK2FTreowOyS0/pND11p3+YqvC5a9Y=
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> Free the adap structure only after we are done using it.

This information can be reasonable.


> This patch just moves the put_device() down a bit to avoid the
> use after free.

I suggest to reconsider such a change because a device reference count
should eventually be decremented before decrementing the reference count
for the module which is managed by this programming interface.
Would you like to clarify the dependencies for such an use case any more?

Regards,
Markus
