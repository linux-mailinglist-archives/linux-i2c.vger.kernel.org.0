Return-Path: <linux-i2c+bounces-7082-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E4E989876
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Sep 2024 01:52:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 304B21C20CB5
	for <lists+linux-i2c@lfdr.de>; Sun, 29 Sep 2024 23:52:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F06A117E473;
	Sun, 29 Sep 2024 23:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I7lXImW8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05AC84A0F;
	Sun, 29 Sep 2024 23:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727653937; cv=none; b=Y+4tWVS52Gp7c5QrOvQ5mS6kmmxHPIHHHbZznlROBU4IWl/oVqpvULr3+n7Mkis/1bXQ8lYTMT0nAQb1Ph5fDBo2il/T7HkM6qiCBXl4JRM2fgCLkRFetX8E5GMWXXZxC/1j0Td7ZjtgqnzEB6EWqTaMDIRMRq03UaRCEFqR5/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727653937; c=relaxed/simple;
	bh=HSR15+5ABD9BAEDGtVfRnYjdL1WnuFcbWPHXHiT02gY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b6AnvoIwHLNqEhczogNNrxKMnjA6yzAaMyDvDwwLVaPIseTK/Y2idF2LqPb0v1HuZ4T5T3t5B8SFTM0L8jZV+AHsCLgkxIo3Hgnl011aGNI36oK96DC6IcXcCYs6aStqzObmcIoqbn7Ou41dRerkJpOo8itcQBgZgyO1W3U2UAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I7lXImW8; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-20696938f86so32155555ad.3;
        Sun, 29 Sep 2024 16:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727653935; x=1728258735; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mBlHitKjXntQkKs3rghy9KYgx5wAIFmLE/7GN1JTY+0=;
        b=I7lXImW8TSszR1YoZ/NTFw7jUaKP07hyTc84jivqUz+QF5QWoRWjbi821x/BdRnfFO
         fjLt7EHcljh17SSBtUa78srQvAhnOZ1b+7W8jUWomREEl4cnF2JI6NRDYle6TK5hN1gE
         6oq5GzMOFLyEg04EAqZVzhJhuXe4R22B3sCH7mnZdGU2jx4JroQl0y87ayjgsxBaCSjH
         OG7MNMmx1TsoPyL01SnEm0jOsJwUGdBI2tYjaHrCyr+pWH5m0iRI1yug8nmJJ12ttaav
         ztJZh8uyVzGgJN9J+7phch5xnhnQa4OITiD7FiJZBSrDSnAp5wkSfcmzqdSK/ni6EbwB
         I/ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727653935; x=1728258735;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mBlHitKjXntQkKs3rghy9KYgx5wAIFmLE/7GN1JTY+0=;
        b=WmrNKR3JGIbvTbj10zNlL1RJqAj6UAvpzPAHeQQzTW8kUQwf43pESrQOEJOuO8iRdf
         NAO4Rr7mp4kK8gDwrD2EIRdclxqfMMqvWWmL5zTK7NfQUAEbhkGDR0cbSgpDXyv6gEt+
         qsHCbyJNrHw0AFFdmnnbQFqTnEbS1t9con3uazRmpo5p5wIGI/zQPtckXFMkyzGyJpmc
         mW/RX1oaHh8XBoQt5gqBrimVC4lYp+OSB8Zj4rplHr1X9AZVQq21joWzFnyS6kitjy4e
         yaAG4jf3JYUG4SUE7L40TTlaxd6MzeGkwHvtoetrSuinrdokklKwnrnwYD/vIJ9ugYoA
         tEpA==
X-Forwarded-Encrypted: i=1; AJvYcCUE0u1gAu/d8xxPwPKj6726eOR240HdmqEDNKXb/JK1QHV/3m7oHvhW/gbTaVuBxhLyQpiSvU0lMsn1@vger.kernel.org, AJvYcCX7sEYnbP7YV4OSFlJB8nESPNFBBp52r8VHjGO9ZWDZJCmvmTSplCna+VpcP3GeSlRYYDBf+fc9StZ2@vger.kernel.org, AJvYcCXjOoblcplQj4rj0G5Ulm4dSS5yNpZNDfWPIQxOtuoxIfw1dp4zhe159SRu2fD2jeARfOfmLU0zPWB3Eddw@vger.kernel.org, AJvYcCXuKbB07/wQ9V9vHjCVsiU6KKJT+jSKILtiFIF3+843k8A1PawMWJNEvN2fvm8S6MHU27ixxvSeF/ez8ZY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyOmIEo0l0IYnAYhHcJO/Vhs4hiCUyvR+c82ATX707456BTOfw
	81IAWvBXDTxVDP8gNtBmYxLEgefjb4MyNkhNrgQinqE49l1ql3U2ke5tXw==
X-Google-Smtp-Source: AGHT+IGFb2HjwYCkOByFknKOZZjCeI++gGmH+Vxw5DPXLqmJxvTY12rvID/9pAK8kWIps3fNJLGzZg==
X-Received: by 2002:a17:90a:db46:b0:2cc:ef14:89e3 with SMTP id 98e67ed59e1d1-2e0b8b1bb4emr12042842a91.15.1727653935110;
        Sun, 29 Sep 2024 16:52:15 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e0b6ca63f9sm6386670a91.33.2024.09.29.16.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2024 16:52:14 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 29 Sep 2024 16:52:12 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Farouk Bouabid <farouk.bouabid@cherry.de>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Peter Rosin <peda@axentia.se>, Jean Delvare <jdelvare@suse.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v8 3/8] dt-bindings: hwmon: add support for ti,amc6821
Message-ID: <9a8909d5-65ef-4533-9dbe-57ba401f94bf@roeck-us.net>
References: <20240906-dev-mule-i2c-mux-v8-0-dbd28a150e41@cherry.de>
 <20240906-dev-mule-i2c-mux-v8-3-dbd28a150e41@cherry.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240906-dev-mule-i2c-mux-v8-3-dbd28a150e41@cherry.de>

On Fri, Sep 06, 2024 at 05:54:14PM +0200, Farouk Bouabid wrote:
> Add dt-bindings for amc6821 intelligent temperature monitor and
> pulse-width modulation (PWM) fan controller.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>

Applied to hwmon-next.

Thanks,
Guenter

> ---
> 
> Notes:
>     Merge after patch 1
> 
>  .../devicetree/bindings/hwmon/ti,amc6821.yaml      | 86 ++++++++++++++++++++++
>  .../devicetree/bindings/trivial-devices.yaml       |  2 -
>  2 files changed, 86 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/ti,amc6821.yaml b/Documentation/devicetree/bindings/hwmon/ti,amc6821.yaml
> new file mode 100644
> index 000000000000..5d33f1a23d03
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/ti,amc6821.yaml
> @@ -0,0 +1,86 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/ti,amc6821.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: AMC6821 Intelligent Temperature Monitor and PWM Fan Controller
> +
> +maintainers:
> +  - Farouk Bouabid <farouk.bouabid@cherry.de>
> +  - Quentin Schulz <quentin.schulz@cherry.de>
> +
> +description:
> +  Intelligent temperature monitor and pulse-width modulation (PWM) fan
> +  controller.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: tsd,mule
> +          - const: ti,amc6821
> +      - const: ti,amc6821
> +
> +  reg:
> +    maxItems: 1
> +
> +  i2c-mux:
> +    type: object
> +
> +required:
> +  - compatible
> +  - reg
> +
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        const: tsd,mule
> +
> +then:
> +  required:
> +    - i2c-mux
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        fan@18 {
> +            compatible = "ti,amc6821";
> +            reg = <0x18>;
> +        };
> +    };
> +
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        fan@18 {
> +            compatible = "tsd,mule", "ti,amc6821";
> +            reg = <0x18>;
> +
> +            i2c-mux {
> +                compatible = "tsd,mule-i2c-mux";
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                i2c@0 {
> +                    reg = <0x0>;
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;
> +
> +                    rtc@6f {
> +                        compatible = "isil,isl1208";
> +                        reg = <0x6f>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
> index 7913ca9b6b54..8ba53cc2672b 100644
> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> @@ -370,8 +370,6 @@ properties:
>            - swir,mangoh-iotport-spi
>              # Ambient Light Sensor with SMBUS/Two Wire Serial Interface
>            - taos,tsl2550
> -            # Temperature Monitoring and Fan Control
> -          - ti,amc6821
>              # Temperature and humidity sensor with i2c interface
>            - ti,hdc1000
>              # Temperature and humidity sensor with i2c interface

