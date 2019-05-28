Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F87F2C09C
	for <lists+linux-i2c@lfdr.de>; Tue, 28 May 2019 09:52:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727547AbfE1Hwk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 May 2019 03:52:40 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:33501 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727621AbfE1Hwk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 May 2019 03:52:40 -0400
Received: from [192.168.178.167] ([109.104.53.9]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1M6UqP-1hY0wY3Quv-006sxW; Tue, 28 May 2019 09:52:23 +0200
Subject: Re: [PATCH v2] i2c: bcm2835: Model Divider in CCF
To:     Annaliese McDermond <nh6z@nh6z.net>, eric@anholt.net,
        f.fainelli@gmail.com, wsa@the-dreams.de, swarren@wwwdotorg.org,
        linux-i2c@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Cc:     team@nwdigitalradio.com
References: <20190508071227.18609-1-nh6z@nh6z.net>
From:   Stefan Wahren <stefan.wahren@i2se.com>
Message-ID: <716a7b8a-c2f8-a3c4-0b3a-be3cb26a6c12@i2se.com>
Date:   Tue, 28 May 2019 09:52:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190508071227.18609-1-nh6z@nh6z.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Provags-ID: V03:K1:totGsbyLC+/SUR0p3/8spMkfZgC2VmnSiIt29PYv8LFlWnINYAR
 zf9OFqH9zfKhYkZ5EIHULKu4N4VCBn7qq62xtBkffWWruhbnFAt5CifTSM1NZqOhk7NpuGI
 Ea7TylpDOyYgv+CK+Lxro3qSUGZCEeT8nR9ExKCtPKdPgTdP6rAs2zrB+NxvenLeCEEB1Y+
 oyHNcX0msyiSm4jO2SJqQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:TiBHJsZG5Pk=:7w6EcfOfkCZvO9NDJBDfx/
 hxwSFPpJ/EMox3+JcejgwJaiTGjfMsYVFK8xbKf8mrYjlVt7apD9+yyE2HrPrKOMIIQbNBc/e
 Aaf3dpb4myUUOxqC3DYC8uqdIHH5sRbOuCevw48OVML65+3CwontCWjQ+/Y1LlubbB0dNCJuj
 hZDpXqVndZ1nm9ZZi2dWJXFSUuICFyFGQ7MsqAVa/CoghWJMG9O2VZbu6UQQHzyGxflBzBqNj
 ss3m3WiNYffA0xNdhvDT5R4wugbg1x2d6axkIFMrYF21AGFngDCEi9rZ7XYi8QXY2eHFn1krJ
 FOQu5ZFHEpl8env9U6wJ6zpY8kfFYY6IiP98H0hKtTc9WxB5fGqZLlw8UTh3DaJs2AnFxYLaN
 Gz7PVYD7jBQjnGxSAGpCCZ/xrW/gmgLiXEoHJYeBW4B0GzEjzgHM1DnocBZt3Mwav2CGxDsOq
 38LGxelGs4Wh3Zow041z4n0LgibfmHoOjc5d//4P0qppgD4j6h1ZqCT+YZeClGxQWuXgF9pVT
 fqbm7NgDP2zlX7bump75qWGSglUaK1RPZHE3pOADKYemONfEXnqcOjawI2rHItVArRfVVqyi4
 r5IXmVwtwNpsvvCTNfdnEJgKjiTfLKHFWBdR1XXsYm+29UDYDc487av6z7opvL1+IWqcj7F6k
 3eU127otzEZDEVmL1l3Z5D/YgdMq+fEfzdeDPwznGn8uIyv9OBcmydDItofQbE6bLQ1TXodzy
 BQz3+mm8GIt3n0jNctnBOQGA+P7Vx2k48Z/UXfnOCENxteGQBwN+ppXf2+o=
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Annaliese,

thank you for mention that we have multiple I2C interfaces.

On 08.05.19 09:12, Annaliese McDermond wrote:
> +
> +static struct clk *bcm2835_i2c_register_div(struct device *dev,
> +					const char *mclk_name,
> +					struct bcm2835_i2c_dev *i2c_dev)
> +{
> +	struct clk_init_data init;
> +	struct clk_bcm2835_i2c *priv;
> +	const char *devname = dev_name(dev);
> +
> +	init.ops = &clk_bcm2835_i2c_ops;
> +	init.name = "bcm2835-i2c";

Does this work intentionally in case i2c-0 and i2c-1 are used at the
same time?

Please also check the output of /sys/kernel/debug/clk/clk_summary

Regards
Stefan

