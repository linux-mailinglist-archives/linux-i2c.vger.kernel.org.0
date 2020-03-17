Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58217187DC1
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Mar 2020 11:05:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725730AbgCQKFK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Mar 2020 06:05:10 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:43241 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726039AbgCQKFG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Mar 2020 06:05:06 -0400
Received: by mail-lj1-f195.google.com with SMTP id r7so22068887ljp.10
        for <linux-i2c@vger.kernel.org>; Tue, 17 Mar 2020 03:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=n09seZt9zQSEmn7PnJzgCcHPTYjmqdsKfcWkGxOyoSw=;
        b=hsHzKaLO8KEYIAs97rD1AMV6mMcqn8KvHqg4ovsIqvIqJsmunKOt1qYqCT5n50NIxg
         5W5zLGTss9f2hdJk1xumbMBaQMEDyvjcEyPZ3jrVx+WFRbtYyH8TPSgzOsF/O0ZDV+R+
         YjoSBTZStIUKJShmEh3hEBHRdVxm1SY6SdsdZnyJxUDVSUVZF76uON1MxQVFXMBzq7je
         dlg8JkAxS2yIyOnnmUE/68pzDOxpbgCvnSFoZcOm6vs6rcpTxYbjby1S67f7NF/Fv36c
         IE9PiIrFyxQp03l/Q0rCM6x04ylSD3FBrTKVotFLkqpNP2woyYPVF4wSIq4KiiZs1osm
         q5YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=n09seZt9zQSEmn7PnJzgCcHPTYjmqdsKfcWkGxOyoSw=;
        b=NPyEHJPiOl5lem5NqSIwVUGfcgY5Lw1cIqPCCArAqTGC5JGwGQKQY2Pw48yOyJDVLi
         eG49X69bFMn50x1asVEjVVC7SJ2J7mnvDImguRUa1kHG2ZEkkzmli62iuyfi+MNr/8Gf
         mT42rgTd3hW8uXeA5MxkyDox6xilGjZtJ64OOGmBFeHp+OBTa/e2zbHq92fWYS4ntWI/
         lWXvc275o9EWnXZ8pr/jYF9R40+OlgUcJ/GI+wTdUoNeJGbUQpsWZyamP8SujiABn59t
         h6A9I4yUYGvHEbeHeMZVZPl067sRtSpl5obaB+b6FJGy+YrKlT5XyHMVTiqL+BpnL9Ru
         mupQ==
X-Gm-Message-State: ANhLgQ0zA1TEZ8TzwEZ8AvkBwvzzMjUOzAS7dBK4vS37LY5p6e0DKOhR
        zeQmcYmz4MMNSPaJLNywd+aFfQ==
X-Google-Smtp-Source: ADFU+vvDFgn0Sv1qdBbtE4XeAKrxupkPbSjYz/5IJ9Z1M/fD+IB/2XXNoyEDPpVkBc5aUWJYf1e6nA==
X-Received: by 2002:a2e:8119:: with SMTP id d25mr2329766ljg.39.1584439502560;
        Tue, 17 Mar 2020 03:05:02 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:48ef:94a3:a481:5e62:4324:124b? ([2a00:1fa0:48ef:94a3:a481:5e62:4324:124b])
        by smtp.gmail.com with ESMTPSA id r7sm1932099ljc.3.2020.03.17.03.05.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2020 03:05:01 -0700 (PDT)
Subject: Re: [PATCH 17/28] dt-bindings: mmc: Fix up clk-phase-sd-hs in an
 example
To:     Lubomir Rintel <lkundrak@v3.sk>, Rob Herring <robh+dt@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Brown <broonie@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-usb@vger.kernel.org
References: <20200317093922.20785-1-lkundrak@v3.sk>
 <20200317093922.20785-18-lkundrak@v3.sk>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <d7ccf5c1-4bfa-2fd2-b32d-a520e96bdd1e@cogentembedded.com>
Date:   Tue, 17 Mar 2020 13:04:55 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200317093922.20785-18-lkundrak@v3.sk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello!

On 17.03.2020 12:39, Lubomir Rintel wrote:

> This way the validator can know that the two cells constitute a singlej

    Single?

> pair of clock phase degrees value, not separate items Otherwise it is

    Forgot a period after "items"?

> unhappy:
> 
>    mmc-controller.example.dt.yaml: mmc@ab000000: clk-phase-sd-hs:0:
>        [63] is too short
>    mmc-controller.example.dt.yaml: mmc@ab000000: clk-phase-sd-hs:1:
>        [72] is too short
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
[...]

MBR, Sergei
