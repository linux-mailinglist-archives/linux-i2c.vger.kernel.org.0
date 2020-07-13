Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99C8721E028
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jul 2020 20:50:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726894AbgGMSuV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Jul 2020 14:50:21 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:46367 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726339AbgGMSuV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 13 Jul 2020 14:50:21 -0400
Received: by mail-io1-f67.google.com with SMTP id a12so14581516ion.13;
        Mon, 13 Jul 2020 11:50:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dxSIKalG5pmPJrENOgt+knqfr40NsiQacbub2rb1U8U=;
        b=NRfIHj68tz946k/pbpdCXaHeNf5JZ7yvvlne8Eb41Eh/vvnFiNaaHSGARzlGV0zAWP
         QpTFMRh8zuAmYyBZMQxDl026wIs0mmxKzi733qvt9qhp3Ury2FkVgDH8m6vESyHtmS2M
         HQNortKZLOPb3IwdmUpkF12WhFhTZhUrY0Q1R8jWeKnNK/zjwWV0HD/cuo2FtSnPFNWX
         oY/NG35NPyY1W04WIsmM5m+ityx7m+oyRU8GtJ5mttByQ8Bp6hGlLkFxsyVkFtMXHiFk
         su8YwHCex36z3OKmCcgl9u7OvvVzmG2of7bry4c/jgqDne4Qq1tmimYa9keRJPQGz6aO
         d7jw==
X-Gm-Message-State: AOAM533gUmGu3bO13r7fgUqJeYiNLi8BSGGTGJtN4ae1OARBI14g+CJ0
        7w+O4zqjxjnTCyG/vgdyKw==
X-Google-Smtp-Source: ABdhPJyLkZZwvj61ZNsHMThlgpkJfwv9jMCmBiY9npdnk2nVKArKeRCDOvgu1OZdIoirrAR4n2N+qg==
X-Received: by 2002:a05:6602:21c3:: with SMTP id c3mr1065368ioc.93.1594666219953;
        Mon, 13 Jul 2020 11:50:19 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id d77sm8967211ill.67.2020.07.13.11.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 11:50:19 -0700 (PDT)
Received: (nullmailer pid 530111 invoked by uid 1000);
        Mon, 13 Jul 2020 18:50:18 -0000
Date:   Mon, 13 Jul 2020 12:50:18 -0600
From:   Rob Herring <robh@kernel.org>
To:     Lubomir Rintel <lkundrak@v3.sk>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        devicetree@vger.kernel.org, linux-rtc@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3 5/5] dt-bindings: timer: Convert mrvl,mmp-timer to
 json-schema
Message-ID: <20200713185018.GA529968@bogus>
References: <20200616223353.993567-1-lkundrak@v3.sk>
 <20200616223353.993567-6-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200616223353.993567-6-lkundrak@v3.sk>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 17 Jun 2020 00:33:53 +0200, Lubomir Rintel wrote:
> A straightforward conversion of the mrvl,mmp-timer binding to DT schema
> format using json-schema.
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> 
> ---
> Changes since v1:
> - Add default GPL-2.0-only license tag
> - Fill in maintainers from MAINTAINERS file
> 
>  .../bindings/timer/mrvl,mmp-timer.txt         | 17 -------
>  .../bindings/timer/mrvl,mmp-timer.yaml        | 46 +++++++++++++++++++
>  2 files changed, 46 insertions(+), 17 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/timer/mrvl,mmp-timer.txt
>  create mode 100644 Documentation/devicetree/bindings/timer/mrvl,mmp-timer.yaml
> 

Applied, thanks!
