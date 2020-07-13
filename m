Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80CB421E00C
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jul 2020 20:49:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726356AbgGMStP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Jul 2020 14:49:15 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:42617 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726318AbgGMStP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 13 Jul 2020 14:49:15 -0400
Received: by mail-io1-f66.google.com with SMTP id c16so14615258ioi.9;
        Mon, 13 Jul 2020 11:49:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aCiNzIRb/i94Ziy734zDNgavUVaioKgtYqD7ynObnzs=;
        b=cr54V41iD9tHY4LzUb2WF14//fCINN6nW+m+eJ3JJvh0XXahlqEdtGIVKl7VxmKT/S
         n7cg2BXl8hCV4HbLGmMiNjXgBHaQeDhVL7eo/q4W/uc3fVpvot54RQtiNnYJveSwYTzW
         YAPb4wwc3DDI+mDedtKKq7RITKcg5xGgGsrPax6N/nVVLgW5JCpq26qIp0aSBhSTGuJ/
         FDwqXywFIdqTLl5vJVJlcnZWVmMETfNWsIBfkUMF144nWu0fBZixGB9LCu3XXg+UA1rv
         /fYvcEl7CN1nyUpqGPQwczwj/CFNCRMBlY/H5t4+EPhQyo0yDl7btJ+2ZoR8G8OMUAjJ
         tn1Q==
X-Gm-Message-State: AOAM532U6+OwN4+uSZwiJLwfbizxKxjJdQwnmBCC6xJUgtY6F3asyAaj
        ryTY+kElo4PCE82ZglF25VRShCVXfw==
X-Google-Smtp-Source: ABdhPJyVVOPkjyR90yMteRSvUYPNKDibQo0H6E/faM4KxNHcY8WN8jZW0+XXxFQSfGxNOEFzwbd61w==
X-Received: by 2002:a5e:a60d:: with SMTP id q13mr1124826ioi.199.1594666153909;
        Mon, 13 Jul 2020 11:49:13 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id s12sm9067267ilk.58.2020.07.13.11.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 11:49:13 -0700 (PDT)
Received: (nullmailer pid 527876 invoked by uid 1000);
        Mon, 13 Jul 2020 18:49:11 -0000
Date:   Mon, 13 Jul 2020 12:49:11 -0600
From:   Rob Herring <robh@kernel.org>
To:     Lubomir Rintel <lkundrak@v3.sk>
Cc:     linux-i2c@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        devicetree@vger.kernel.org, linux-rtc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v3 1/5] dt-bindings: gpio: Convert mrvl-gpio to
 json-schema
Message-ID: <20200713184911.GA527802@bogus>
References: <20200616223353.993567-1-lkundrak@v3.sk>
 <20200616223353.993567-2-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200616223353.993567-2-lkundrak@v3.sk>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 17 Jun 2020 00:33:49 +0200, Lubomir Rintel wrote:
> This converts the mrvl-gpio binding to DT schema format using json-schema.
> 
> Various fixes were done during the conversion, such as adding more
> properties that are in fact mandatory or extending the examples to
> include child nodes with extra GPIO blocks.
> 
> The compatible strings are a mess. It is not clear why so many of them
> are needed; the driver doesn't really seem to differentiate between the
> models. Some of them, like marvell,pxa93x-gpio and marvell,pxa1928-gpio
> are not used at all, so it's not known how many interrupts they utilize.
> On the other hand, mrvl,pxa-gpio has been seen in the tree, but it
> doesn't end up in any actual DTB file.
> 
> In any case -- the schema merely copies whatever was in the original
> binding document, so it's hopefully no more wrong that the original.
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> 
> ---
> Changes since v2:
> - Don't make ranges property mandatory
> 
> Changes since v1:
> - Drop marvell,pxa1928-gpio
> - Drop ranges from example with no gcb child nodes
> - Add default GPL-2.0-only license tag
> - Fill in maintainers from MAINTAINERS file
> 
>  .../devicetree/bindings/gpio/mrvl-gpio.txt    |  48 -----
>  .../devicetree/bindings/gpio/mrvl-gpio.yaml   | 173 ++++++++++++++++++
>  2 files changed, 173 insertions(+), 48 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/gpio/mrvl-gpio.txt
>  create mode 100644 Documentation/devicetree/bindings/gpio/mrvl-gpio.yaml
> 

Applied, thanks!
