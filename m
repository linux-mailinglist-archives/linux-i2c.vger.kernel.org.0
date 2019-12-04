Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 161F4112E31
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Dec 2019 16:22:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728209AbfLDPWi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 4 Dec 2019 10:22:38 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:46805 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727828AbfLDPWi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 4 Dec 2019 10:22:38 -0500
Received: by mail-oi1-f194.google.com with SMTP id a124so7129800oii.13;
        Wed, 04 Dec 2019 07:22:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6sPha/wbJhMAM5wPncZACHp8KjMdGhsy8S0M1rRpaf8=;
        b=gsNNINqimOgoSGUwTJcVOyF7p1n+l9fsQ3+4gcj9pUpuhR6ChUtK4Aq/bDAyc1LvzX
         RriT5wsksI/51e1+1YgYoIvFpolFxPkaVAelpKHEzKBIzrRBvCo9kg7OSU6TmfC6bfWZ
         gU6N1zua9Xxae+xEQLBQwv4owbBcBHM3VpK11H94wt5P1cUARTQlrEmOs9esI6J42rtK
         21ITaiPpYsbPU0ZrCEVf4FG3imFC1kqpQ1SOk/BCIKei5F/j+AWsnbv0TPRFcHcUa2/g
         ZiUP4z5xWvMTLON+0P6gUCKyYYjTdb+WlgmBeigtm7SrDo9DKlr+75Tm8YFYwGyDpHyX
         Ie8A==
X-Gm-Message-State: APjAAAXIrs2UZacmwlkf+oavtZanFIaK+7UEjHbydGKG1bA7N+zCYxIa
        8hJAbbsCqgwvHE/PxyK9BA==
X-Google-Smtp-Source: APXvYqw8kKCWJtpWF4IZtXkjbDj7ihw7FUCSOym5glyPaxqeYYa79GKcja0rok7LmHGBYe7QPSY9CA==
X-Received: by 2002:aca:b986:: with SMTP id j128mr3137425oif.16.1575472957574;
        Wed, 04 Dec 2019 07:22:37 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id c204sm2388795oia.14.2019.12.04.07.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2019 07:22:37 -0800 (PST)
Date:   Wed, 4 Dec 2019 09:22:36 -0600
From:   Rob Herring <robh@kernel.org>
To:     Khouloud Touil <ktouil@baylibre.com>
Cc:     bgolaszewski@baylibre.com, mark.rutland@arm.com,
        srinivas.kandagatla@linaro.org, baylibre-upstreaming@groups.io,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, linus.walleij@linaro.org
Subject: Re: [PATCH 3/4] dt-bindings: at24: remove the optional property
 write-protect-gpios
Message-ID: <20191204152236.GA22464@bogus>
References: <20191120142038.30746-1-ktouil@baylibre.com>
 <20191120142038.30746-4-ktouil@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191120142038.30746-4-ktouil@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Nov 20, 2019 at 03:20:37PM +0100, Khouloud Touil wrote:
> NVMEM framework is an interface for the at24 EEPROMs as well as for
> other drivers, instead of passing the wp-gpios over the different
> drivers each time, it would be better to pass it over the NVMEM
> subsystem once and for all.
> 
> Removing the optional property form the device tree binding document.
> 
> Signed-off-by: Khouloud Touil <ktouil@baylibre.com>
> ---
>  Documentation/devicetree/bindings/eeprom/at24.yaml | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documentation/devicetree/bindings/eeprom/at24.yaml
> index e8778560d966..9894237ac432 100644
> --- a/Documentation/devicetree/bindings/eeprom/at24.yaml
> +++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
> @@ -145,11 +145,6 @@ properties:
>        over reads to the next slave address. Please consult the manual of
>        your device.
>  
> -  wp-gpios:
> -    description:
> -      GPIO to which the write-protect pin of the chip is connected.
> -    maxItems: 1
> -

At least 'wp-gpios: true' is still needed or you need to reference the 
common definition in nvmem.yaml. The reason being is every possible 
property (and child node) needs to be listed so we can have errors on 
any that aren't.

Rob
