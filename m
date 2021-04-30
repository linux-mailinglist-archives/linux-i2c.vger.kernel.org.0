Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78486370213
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Apr 2021 22:31:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235948AbhD3U37 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 30 Apr 2021 16:29:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234471AbhD3U37 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 30 Apr 2021 16:29:59 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C31EC06174A;
        Fri, 30 Apr 2021 13:29:10 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id n2so107086455ejy.7;
        Fri, 30 Apr 2021 13:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Wrp/1A4Vx3OcbB2pr/PEDNHt/zuDZ0QGymHwI8CKIHg=;
        b=EY+IEzBUu9oW5ND5WvGXq8irviGV51BVZB/O3Zuztl09Q1rCW+7Ytf+kbvQ8J/IONX
         sa5FRjyjdK7CfM7edv5v87pTGvSmtSQhm/I9n/IFA6ydKhNL6Pdy4S7zNIWx3F5XKMh4
         QqQYDMQ4KB08czfy3KaNmEagCc92tSObszTsL7tWA9k1Rm/bt/u17BnmBG3fF2J1dwok
         rDWwmQvPFWagsI4tIfva00Jqe4fYsPb56e+ZqYE/EDGbUVI0Pd0mayzLN8H4j3z7lFKg
         H3PpdOHA4dygCIzqWgRCYQBdIVQTC1H7N0gtUv0BcKjlu+mONsymqkgR3tItKiXoHXVg
         tKKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Wrp/1A4Vx3OcbB2pr/PEDNHt/zuDZ0QGymHwI8CKIHg=;
        b=S5e4j6QPspDYeebRDfUVCXhIZrafdnzM1W0f6G0F74ZQNc/icg2uP6+IMUEoBhj0gR
         HQBvvP9HA92BSM3sfBvYlAv6gyJ01EcBZJOT1QAhXyFVZy5ReZY+piwsigz06Iq+iWwF
         /jxPkBW+ly0zuqVD0SInTn9FZduuAEJR+PBAYDU3zVMljPt+rSJscgWvNWX/R4PlDv0S
         T8ywuSIFgLsZB++qDe/daIDs/Lc7GEOSdvdO23vnL4wercWjvSya3/JelyAZSQym+Thr
         uGoiIY+5C0JTVbGTRi5YHzMB2OuOBlNPEco4p6b3wylAhyah5509jcE7+q5NyG9vO2Dq
         LbCg==
X-Gm-Message-State: AOAM5315eIWAar515tg8lUgM3NUM4lxpwuCZXKwcX1fJub2Oyezc+EKW
        bHsPZ2tw8KBPa5Lj2rgMXk8=
X-Google-Smtp-Source: ABdhPJzx0kI7Y5mCHmBcgoMkoXDcdMXPnCoSKVhqyWYiLS59obUrogmNsVukVf6Nz96RySLz4B/BRQ==
X-Received: by 2002:a17:907:1b1e:: with SMTP id mp30mr6448680ejc.532.1619814548930;
        Fri, 30 Apr 2021 13:29:08 -0700 (PDT)
Received: from [192.168.2.2] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id da25sm2568034edb.38.2021.04.30.13.29.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Apr 2021 13:29:08 -0700 (PDT)
Subject: Re: [PATCH v4 07/10] dt-bindings: soc: rockchip: Convert grf.txt to
 YAML
To:     Rob Herring <robh@kernel.org>, cl@rock-chips.com
Cc:     heiko@sntech.de, jagan@amarulasolutions.com, wens@csie.org,
        uwe@kleine-koenig.org, mail@david-bauer.net,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        jensenhuang@friendlyarm.com, michael@amarulasolutions.com,
        cnsztl@gmail.com, devicetree@vger.kernel.org,
        ulf.hansson@linaro.org, linux-mmc@vger.kernel.org,
        gregkh@linuxfoundation.org, linux-serial@vger.kernel.org,
        linux-i2c@vger.kernel.org, jay.xu@rock-chips.com,
        shawn.lin@rock-chips.com, david.wu@rock-chips.com,
        zhangqing@rock-chips.com, huangtao@rock-chips.com,
        wim@linux-watchdog.org, linux@roeck-us.net, jamie@jamieiles.com,
        linux-watchdog@vger.kernel.org, maz@kernel.org
References: <20210429081151.17558-1-cl@rock-chips.com>
 <20210429081321.17855-1-cl@rock-chips.com>
 <20210429212413.GA1794356@robh.at.kernel.org>
From:   Johan Jonker <jbx6244@gmail.com>
Message-ID: <c4130ba7-5f28-57e9-f391-89b6539fb29c@gmail.com>
Date:   Fri, 30 Apr 2021 22:29:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210429212413.GA1794356@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 4/29/21 11:24 PM, Rob Herring wrote:
> On Thu, Apr 29, 2021 at 04:13:21PM +0800, cl@rock-chips.com wrote:
>> From: Liang Chen <cl@rock-chips.com>
>>
>> Current dts files with 'grf' nodes are manually verified. In order to
>> automate this process grf.txt has to be converted to YAML.
>>
>> Add new descriptions for:
>> "rockchip,rk3568-grf", "syscon", "simple-mfd"
>> "rockchip,rk3568-pmugrf", "syscon", "simple-mfd"
>>
>> Signed-off-by: Liang Chen <cl@rock-chips.com>
>> ---

[..]

>> +properties:
>> +  compatible:
>> +    - items:
> 
> The '-' is the source of your error.
> 
>> +        - enum:
>> +            - rockchip,px30-grf
>> +            - rockchip,px30-pmugrf
>> +            - rockchip,px30-usb2phy-grf
>> +            - rockchip,rk3036-grf
>> +            - rockchip,rk3066-grf
>> +            - rockchip,rk3188-grf
>> +            - rockchip,rk3228-grf
>> +            - rockchip,rk3288-grf
>> +            - rockchip,rk3288-sgrf
>> +            - rockchip,rk3308-core-grf
>> +            - rockchip,rk3308-detect-grf
>> +            - rockchip,rk3308-grf
>> +            - rockchip,rk3328-grf
>> +            - rockchip,rk3328-usb2phy-grf
>> +            - rockchip,rk3368-grf
>> +            - rockchip,rk3368-pmugrf
>> +            - rockchip,rk3399-grf
>> +            - rockchip,rk3399-pmugrf
>> +            - rockchip,rk3568-grf
>> +            - rockchip,rk3568-pmugrf
>> +            - rockchip,rv1108-grf
>> +            - rockchip,rv1108-usbgrf
>> +        - const: syscon
>> +        - const: simple-mfd
> 

> 'simple-mfd' was not in the old binding. That implies you have child 
> nodes, and if so, they need to be documented. I imagine that will mean 
> splitting this into multiple schemas if that's the case.
> 

Hi,

Question for rob+dt:

Given that a number of txt documents still are in need for YAML
conversion. Which is a bit beyond the author of this serie.
The core rk3568.dtsi is needed for other series to base on.

To speed things up a bit and reduce the work load:
Is it possible to add the grf compatibles in use first and do the rest
of the subnodes for various SoCs later?

Is it possible to add for now to reduce notification output:

additionalProperties: true

and then later:

additionalProperties: false


===

From build log:

#address-cells
#size-cells
reboot-mode
io-domains
usb2-phy@100
mipi-dphy-rx0
pcie-phy
phy@f780
edp-phy
usbphy
lvds
power-controller
grf-gpio

===

Example for rk3399:

	grf: syscon@ff770000 {
		compatible = "rockchip,rk3399-grf", "syscon", "simple-mfd";

		io_domains: io-domains {
			compatible = "rockchip,rk3399-io-voltage-domain"; //
rockchip-io-domain.txt
		};

		mipi_dphy_rx0: mipi-dphy-rx0 {
			compatible = "rockchip,rk3399-mipi-dphy-rx0"; //
rockchip-mipi-dphy-rx0.yaml
		};

		u2phy0: usb2-phy@e450 {
			compatible = "rockchip,rk3399-usb2phy"; // phy-rockchip-inno-usb2.yaml
		};

		u2phy1: usb2-phy@e460 {
			compatible = "rockchip,rk3399-usb2phy"; // phy-rockchip-inno-usb2.yaml
		};

		emmc_phy: phy@f780 {
			compatible = "rockchip,rk3399-emmc-phy"; // rockchip-emmc-phy.txt
		};

		pcie_phy: pcie-phy {
			compatible = "rockchip,rk3399-pcie-phy"; // rockchip-pcie-phy.txt
		};
	};
