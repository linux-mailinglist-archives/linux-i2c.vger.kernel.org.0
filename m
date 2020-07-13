Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3090821E012
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jul 2020 20:49:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726624AbgGMSt2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Jul 2020 14:49:28 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:40982 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726318AbgGMSt2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 13 Jul 2020 14:49:28 -0400
Received: by mail-io1-f66.google.com with SMTP id p205so6079588iod.8;
        Mon, 13 Jul 2020 11:49:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WpeYQUMwj5FW9OutksMiaaeD0G6oI/PxDGyWumbAV1c=;
        b=tr2Lec6/dgWr1TMP15bC7fAJ1kJFCvbHzRR1n18WgheTTYoJENd3HAD5Zd7fJ1nOGH
         R9slY+EmOwgDKYvPBICTgUrn797RWFuB8yJIZHJUba/btmFsWZ8fyYA/TE8gxyXK503y
         VlrY6AWHXpQhohI6SFfvNl13vm8+IewfO+s8QXt+yYZVgUM0Y8iK2cRdPC0NNoUmXN2a
         3/8Krt3mn3y96pqovyEa0yHXsWXVsjsjjE1Ga4ia+JZ85DPoGT+jdMPD1V6udbR9PWBm
         xhswhXHL56INGneZySGDlwHi43oBYKfmM0VkOzND4HDN9/hp0+rVjrdY+IiUdlKnB/Wf
         9YGA==
X-Gm-Message-State: AOAM532heks1dxsqtNKj3sQgJveW6Dhk1ycxULfGZkYxPHhtF64cvEyh
        wPqv6QemAbsRYP3x3Ueb8g==
X-Google-Smtp-Source: ABdhPJxu+gqvcd5wPFL85eaNribV65nExAy/TIGBAyqM6m6EAXlxGwJo/s3aFQZfYPFh7kq4YvPoMA==
X-Received: by 2002:a02:cd91:: with SMTP id l17mr1633141jap.88.1594666167050;
        Mon, 13 Jul 2020 11:49:27 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id t11sm8648543ils.3.2020.07.13.11.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 11:49:26 -0700 (PDT)
Received: (nullmailer pid 528372 invoked by uid 1000);
        Mon, 13 Jul 2020 18:49:25 -0000
Date:   Mon, 13 Jul 2020 12:49:25 -0600
From:   Rob Herring <robh@kernel.org>
To:     Lubomir Rintel <lkundrak@v3.sk>
Cc:     Thomas Gleixner <tglx@linutronix.de>, linux-rtc@vger.kernel.org,
        linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Marc Zyngier <maz@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/5] dt-bindings: i2c: Convert i2c-pxa to json-schema
Message-ID: <20200713184925.GA528293@bogus>
References: <20200616223353.993567-1-lkundrak@v3.sk>
 <20200616223353.993567-3-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200616223353.993567-3-lkundrak@v3.sk>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 17 Jun 2020 00:33:50 +0200, Lubomir Rintel wrote:
> A conversion of the i2c-pxa binding to DT schema format using json-schema.
> 
> This also cleans ups some errors in the binding: The compatible string
> description suggested that "mmp" in "mrvl,mmp-twsi" is to be substituted
> with a processor model, which wouldn't be a right thing to do and indeed
> nobody seems to have been doing that. There also was "Recommended
> properties" section that included optional as well as mandatory
> properties. Missing mandatory properties were added to the example.
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> 
> ---
> Changes since v2:
> - Add unevaluatedProperties: false
> 
> Changes since v1:
> - Add default GPL-2.0-only license tag
> - Fill in maintainers from MAINTAINERS file
> 
>  .../devicetree/bindings/i2c/i2c-pxa.txt       | 31 --------
>  .../devicetree/bindings/i2c/i2c-pxa.yaml      | 74 +++++++++++++++++++
>  2 files changed, 74 insertions(+), 31 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-pxa.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-pxa.yaml
> 

Applied, thanks!
