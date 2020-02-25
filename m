Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC5A816EDA6
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2020 19:15:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731405AbgBYSPC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Feb 2020 13:15:02 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:38873 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728367AbgBYSPC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Feb 2020 13:15:02 -0500
Received: by mail-oi1-f194.google.com with SMTP id r137so242528oie.5;
        Tue, 25 Feb 2020 10:15:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=sRPxV5iSvPN80K6tvKNtciXRBCMachxheO+dmsdwNT0=;
        b=Nr6Hz9U0nsRcJnZ9q4TNOERxSlQMNcuhl6QlpT8EX3rG2/0hs+CRSoFFGitmqo1uIf
         13RMOsr0IgZk6fcdT/eMQMlEPg+emdbwTLg2HidVP/ps1k9FsoVuzE/FQWLyjQuxRKPY
         msEL+fZjGRCEb3SKDHXLSapXCVLfBrA0utrx0vFK1uLmBofXknw544Zd/etGNYj3U/P8
         WjSYW1NWL4Uu9Oyoi7USzwdbVOPRkxzsYvyp7kx7q3C8cxro7a/8TmIa7WW1heTGEL1X
         z28j1kQEufnulKBoLcXlVqhcke52yFO2hNQor3VbKPN/0CotY5FohaNS/8XnSxtCAFc3
         AhDA==
X-Gm-Message-State: APjAAAWRU+kDss3hIEQswV/jQKw8vANBpDzdCb1cHB3Nqq34C8ut69L5
        NCeL6hxRvrPQWzmFbO1MyQ==
X-Google-Smtp-Source: APXvYqxWUUIv2aQqOuCp8OaRKWv2QrkvHU2RtzwROvmadfZZRS7+D+CIBSg3H3p92q957/Sr7GWDHg==
X-Received: by 2002:aca:5f87:: with SMTP id t129mr199368oib.36.1582654501742;
        Tue, 25 Feb 2020 10:15:01 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i6sm5902042oto.62.2020.02.25.10.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 10:15:01 -0800 (PST)
Received: (nullmailer pid 601 invoked by uid 1000);
        Tue, 25 Feb 2020 18:15:00 -0000
Date:   Tue, 25 Feb 2020 12:15:00 -0600
From:   Rob Herring <robh@kernel.org>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Eric Anholt <eric@anholt.net>, devicetree@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Kamal Dasu <kdasu.kdev@gmail.com>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-i2c@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
        linux-rpi-kernel@lists.infradead.org,
        Phil Elwell <phil@raspberrypi.com>,
        linux-arm-kernel@lists.infradead.org,
        Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 02/89] dt-bindings: i2c: brcmstb: Add BCM2711
 BSC/AUTO-I2C  binding
Message-ID: <20200225181500.GA538@bogus>
References: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
 <9e427ff22fa40b7146b44aee6468559499deb1f1.1582533919.git-series.maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9e427ff22fa40b7146b44aee6468559499deb1f1.1582533919.git-series.maxime@cerno.tech>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 24 Feb 2020 10:06:04 +0100, Maxime Ripard wrote:
> The HDMI blocks in the BCM2771 have an i2c controller to retrieve the
> EDID. This block is split into two parts, the BSC and the AUTO_I2C,
> lying in two separate register areas.
> 
> The AUTO_I2C block has a mailbox-like interface and will take away the
> BSC control from the CPU if enabled. However, the BSC is the actually
> the same controller than the one supported by the brcmstb driver, and
> the AUTO_I2C doesn't really bring any immediate benefit.
> 
> We can model it in the DT as a single device with two register range,
> which will allow us to use or or the other in the driver without
> changing anything in the DT.
> 
> Cc: Kamal Dasu <kdasu.kdev@gmail.com>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Wolfram Sang <wsa@the-dreams.de>
> Cc: bcm-kernel-feedback-list@broadcom.com
> Cc: linux-i2c@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  Documentation/devicetree/bindings/i2c/brcm,brcmstb-i2c.yaml | 40 ++++++-
>  1 file changed, 39 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
