Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D73B6B54EB
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Sep 2019 20:11:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727454AbfIQSLC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Sep 2019 14:11:02 -0400
Received: from mout.web.de ([212.227.17.11]:54461 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726883AbfIQSLC (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 17 Sep 2019 14:11:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1568743856;
        bh=d9TW36q57TtUhaDqRDnDUDN9MbferJkF9Berl7AxpXQ=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=YdzhHD7/jnILKo49qeykDgMoU2hGjeGFbAn3W1kg1IrA2L0xkmp1JZuCSBZnd+Y4L
         srTBhhaZOVU6erJnaucEe6yRLciYFqw4/CfPCUixM+ZWrrYZssY3bT689VwFmvy8r9
         baPq9xXw4AkFp+mPR4orQwTcdLsUNn0T0CI+jhbc=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.244.93.51]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LoHTx-1hhZpO3qrB-00gJla; Tue, 17
 Sep 2019 20:10:56 +0200
Subject: Re: [v2 0/3] Fix issues reported by Coccinelle
To:     Saiyam Doshi <saiyamdoshi.in@gmail.com>,
        Andy Gross <agross@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190917172758.GA11926@SD>
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <76e99512-8818-cec2-9e77-799e4c8481ab@web.de>
Date:   Tue, 17 Sep 2019 20:10:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20190917172758.GA11926@SD>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8iF/rVcBhpF/5hzQPOepRHdnbxTMksQyZZQoForHX9BV+XO2NxY
 LY8yc9PY3SdWmWCT7esS6jB+iiX23BPp5WUgz+Te4BfafnhU1LiG0XFFYGHFeoEqcu07c4f
 kpCBWtNn0Qt6AGqt/n7qHJYLBfCkmPP13OLbuNJ+kEXRdrayAeL/2ZNSAqMWExXji6hg1Dz
 vULKXRqjHvzRMy4uZMCTg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:nBQyYiLcrTY=:dKrENFSDBqcF+q6heRPfZe
 vIb7OX7MZu/XaJL0yhSRXmDFl02SU3zuT4woki/+FCKV3BaeoyCX5gogRf3DLGpVM6DWazt3P
 nJhxbSHg4cb6B1DQTkV0dSNOu52akRXO6dM+2GJvkQrSyeztQzOSMpTUxHHhXuPl+J4oEVGf6
 9+EdY/+s6CNf59xrF3Ws9rw1qvMsizSVVr9uZlikcBpP7hFVSkYk4ipTLpRcc9kfAK8aEjdx2
 RL0gxhEf1iR5BM5RQrDcZZsIXstvfiPhgFH9megn7J20gAG4C8RpSYnE5sKtHdIbWrp4afqiS
 nH5am3PoF1da3k/MOqldJYUg865yDEIXSP74fcue2YVX8j3yyRX7xrZikGYS+NCBFwa5BmWES
 CaZKfWj5uIrKrC21ffdQjX3sQS2wpoR/O7QKJ09Wj37IGs5Uba5fb43QqEFD1ylYEDBGQ1vWN
 YfECCRNE+q9Bi+uQbnzXEi+0wI7WGwsVPgSWNyrTyQLsL/SBZLL65HugTN9l7ZckCMK58M+gL
 35uRtjBDZCR+BTpf8hpy0B1RdJwibFBpRAm3lMjEtt3CHoqt0ASHuUP5TTLoclpJg9xxLSUnh
 UcWRhWGVouawg62E/CGxqirA5oCFJdsQw0o977y21BUgwEbK3somXMWO4TNDrCREtiNAxbKsf
 GYgSoaKk8YCb4mWh05CuyjUL9WGfUKVVCakG5vR8Rx/NYrMQIsHBUp4NXBJvP25skPGeYhglJ
 ZzZGnl9Xc6UgouKz+pf6J0Svxlpf/Sw0EiYc98Bjesg+GB97a70BFI4scYlNsWL2WRBRtd/Am
 1GVj7JBF6E9kQNsgzn2ZMNezzU04QO6YxUjEghirt7PyW1bvRqnVbzc9dyUXUcqLp5248+jVG
 z/3tEXv9lVp97+NhW9PAsnq3eWkGMiOhDVUWVdxcROzAV0JA61gdIrfYYf/5htx4jk5T27S/N
 5ZjZGhoG4O0CQqlofcLnIq7Cif78mEtlvomhFSKLTv7lqlnK0DSUysdjePy46PlQkNxdxsHL5
 L5+4prOA/ZNaAwmZt9brRYC8FfFZN8fPCeNJM/FE5fUZmeHPYlFKIgl7oA+az3M+JQ6WNexgx
 wCK2W2gh4KZsTzLDfKuLYrQonKaRhcmJm5nLNuR0+ZvXpXgzjViSdjxTI9P7HsZwhl14LHzbA
 mzrPQJecDkEt6UBWEY5JYL79JlnJTlJ/DfHkrsM6Vj+XJAgNum9VasxtIB5sx+UA19rngO2fp
 lo9rjDUfuMDclMBBqN/izdqrNNr4hW7YpXSwq3Vc9kAEHF62BAo9LxPkKsKA=
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> Using cocciecheck to ensure there are no semantic issues in
> i2c-qup driver.

* This wording contains a typo.

* I would prefer to refer to a desired reduction of a few
  source code quality concerns.


> Changes in =E2=80=A6

Can such a prefix be omitted?

Regards,
Markus
