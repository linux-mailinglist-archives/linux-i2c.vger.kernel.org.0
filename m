Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA69B6107E9
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Oct 2022 04:24:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236019AbiJ1CYL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 Oct 2022 22:24:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236145AbiJ1CYF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 27 Oct 2022 22:24:05 -0400
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF90ABBF03
        for <linux-i2c@vger.kernel.org>; Thu, 27 Oct 2022 19:24:03 -0700 (PDT)
Received: by mail-qt1-x830.google.com with SMTP id bb5so2727282qtb.11
        for <linux-i2c@vger.kernel.org>; Thu, 27 Oct 2022 19:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E6YuEbTvxm7O8eyz47pGuOxddlgQTa4cA4pcPo4hUJI=;
        b=RvlZ3dTbvauA0B99ZDIDWWl4qM24s6MUS96r7BYXXIAT5tHrm1exYmum8d7Vfm3JOL
         Jrj5sH/PWSHWpzg57Wfnuha+zWwzfBsFLA0pxjYmnTUAuJrYu6D4u9FLr4Czr+D4W5q8
         WPQ6e3FtrFB0me3+8x4cmCq1a+RGF6YiHBskpw0gPQWkjSMFNKHZxPOl7JotM72QHQ7a
         BGYrGphF7UspE8vHDBoHpFHCZZHmExHZKcDyE1MCoK7pvaVZj6gS8rDe3zhURAY90O9q
         KEIOue7TlunFyK0JhxXrLhCgha6L/iqVxXNC5w1h2q3wCSw8eIfOd9E6SEVyhSdwKyQH
         QV4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E6YuEbTvxm7O8eyz47pGuOxddlgQTa4cA4pcPo4hUJI=;
        b=dMAi4PeawJLUEJDIN3mOu702y9BbmfDod20xxIQKl7xkrjj4xLuBbOtcDlKIsD2CVX
         iHrCn0W/N8GoGHdD0wGkq8uBQtzVjZPCIWSJinVKnhxPlHaBjQE6is7hIiMXU5akW5Ge
         flMfg/xBPbovZOOTFTQlTlie8+REovWpMvmr3NldRBVdxtKYeZu6cMStKM685HIZiba+
         gZTQAmMM+6n4vYQ3vkWv4wgNWyXr/PLmFEv5uFhqQgL3AFuX2wDD99JBLVU9Up8hPVJt
         B+kOF1MGy28pxU0hA08Y+bUNJFtAW2JW5hMDesUZ5Xe15YUtZARP7cuAmFsw5WuV9fl2
         B3IA==
X-Gm-Message-State: ACrzQf16U97kbes6BZxiTbW191tS7RKX8iCsmcCWlT0F5oqyDfJyJ2ag
        2faPj16e7yKOtBK+rxCUKob5UA==
X-Google-Smtp-Source: AMsMyM5edx+u+jXkjLS022OCRzFXFfJ2caHhvxv7SfETslJUAjLK7INIk8S3YdDxs5ghQZ5SACKP+g==
X-Received: by 2002:a05:622a:c5:b0:39c:f1c2:6732 with SMTP id p5-20020a05622a00c500b0039cf1c26732mr45199906qtw.588.1666923842972;
        Thu, 27 Oct 2022 19:24:02 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id c2-20020a05622a024200b0038b684a1642sm1802068qtx.32.2022.10.27.19.24.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Oct 2022 19:24:02 -0700 (PDT)
Message-ID: <2059dfe5-b084-42a4-7f35-9da9561fc12b@linaro.org>
Date:   Thu, 27 Oct 2022 22:23:59 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 04/11] arm64: tegra: Enable XUSB host and device on Jetson
 AGX Orin
Content-Language: en-US
To:     Wayne Chang <waynec@nvidia.com>, gregkh@linuxfoundation.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        treding@nvidia.com, jonathanh@nvidia.com, thierry.reding@gmail.com,
        heikki.krogerus@linux.intel.com, ajayg@nvidia.com, kishon@ti.com,
        vkoul@kernel.org, p.zabel@pengutronix.de, balbi@kernel.org,
        mathias.nyman@intel.com, jckuo@nvidia.com
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, singhanc@nvidia.com,
        linux-i2c@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-tegra@vger.kernel.org
References: <20221024074128.1113554-1-waynec@nvidia.com>
 <20221024074128.1113554-5-waynec@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221024074128.1113554-5-waynec@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 24/10/2022 03:41, Wayne Chang wrote:
> This commit enables XUSB host, device, and pad controller on
> Jetson AGX Orin.
> 
> Signed-off-by: Wayne Chang <waynec@nvidia.com>
> ---
>  .../boot/dts/nvidia/tegra234-p3701-0000.dtsi  |  48 +++++
>  .../nvidia/tegra234-p3737-0000+p3701-0000.dts | 184 ++++++++++++++++++
>  arch/arm64/boot/dts/nvidia/tegra234.dtsi      | 170 ++++++++++++++++
>  3 files changed, 402 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi
> index 9e4d72cfa69f..8acef87a5398 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi
> @@ -61,6 +61,29 @@ mmc@3460000 {
>  			non-removable;
>  		};
>  
> +		padctl@3520000 {
> +			vclamp-usb-supply = <&vdd_ao_1v8>;
> +			avdd-usb-supply = <&vdd_ao_3v3>;
> +
> +			ports {
> +				usb2-0 {
> +					vbus-supply = <&vdd_5v0_sys>;
> +				};
> +
> +				usb2-1 {
> +					vbus-supply = <&vdd_5v0_sys>;
> +				};
> +
> +				usb2-2 {
> +					vbus-supply = <&vdd_5v0_sys>;
> +				};
> +
> +				usb2-3 {
> +					vbus-supply = <&vdd_5v0_sys>;
> +				};
> +			};
> +		};
> +
>  		rtc@c2a0000 {
>  			status = "okay";
>  		};
> @@ -69,4 +92,29 @@ pmc@c360000 {
>  			nvidia,invert-interrupt;
>  		};
>  	};
> +
> +	vdd_5v0_sys: regulator@0 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VIN_SYS_5V0";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
> +	vdd_ao_1v8: regulator@1 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vdd-AO-1v8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-always-on;
> +	};
> +
> +	vdd_ao_3v3: regulator@2 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vdd-AO-3v3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +	};
>  };
> diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
> index 57ab75328814..b4630280bb32 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
> +++ b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
> @@ -2011,6 +2011,190 @@ hda@3510000 {
>  			nvidia,model = "NVIDIA Jetson AGX Orin HDA";
>  			status = "okay";
>  		};
> +
> +		padctl@3520000 {
> +			status = "okay";
> +
> +			pads {
> +				usb2 {
> +					lanes {
> +						usb2-0 {
> +							status = "okay";
> +						};
> +
> +						usb2-1 {
> +							status = "okay";
> +						};
> +
> +						usb2-2 {
> +							status = "okay";
> +						};
> +
> +						usb2-3 {
> +							status = "okay";
> +						};
> +					};
> +				};
> +
> +				usb3 {
> +					lanes {
> +						usb3-0 {
> +							status = "okay";
> +						};
> +
> +						usb3-1 {
> +							status = "okay";
> +						};
> +
> +						usb3-2 {
> +							status = "okay";
> +						};
> +					};
> +				};
> +			};
> +
> +			ports {
> +				usb2-0 {
> +					mode = "otg";
> +					usb-role-switch;
> +					status = "okay";
> +					port {
> +						hs_typec_p1: endpoint {
> +							remote-endpoint = <&hs_ucsi_ccg_p1>;
> +						};
> +					};
> +				};
> +
> +				usb2-1 {
> +					mode = "host";
> +					status = "okay";
> +					port {
> +						hs_typec_p0: endpoint {
> +							remote-endpoint = <&hs_ucsi_ccg_p0>;
> +						};
> +					};
> +				};
> +
> +				usb2-2 {
> +					mode = "host";
> +					status = "okay";
> +				};
> +
> +				usb2-3 {
> +					mode = "host";
> +					status = "okay";
> +				};
> +
> +				usb3-0 {
> +					nvidia,usb2-companion = <1>;
> +					status = "okay";
> +					port {
> +						ss_typec_p0: endpoint {
> +							remote-endpoint = <&ss_ucsi_ccg_p0>;
> +						};
> +					};
> +				};
> +
> +				usb3-1 {
> +					nvidia,usb2-companion = <0>;
> +					status = "okay";
> +					port {
> +						ss_typec_p1: endpoint {
> +							remote-endpoint = <&ss_ucsi_ccg_p1>;
> +						};
> +					};
> +				};
> +
> +				usb3-2 {
> +					nvidia,usb2-companion = <3>;
> +					status = "okay";
> +				};
> +			};
> +		};
> +
> +		usb@3550000 {
> +			status = "okay";
> +
> +			phys = <&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-0}>,
> +				<&{/bus@0/padctl@3520000/pads/usb3/lanes/usb3-1}>;
> +			phy-names = "usb2-0", "usb3-1";
> +		};
> +
> +		usb@3610000 {
> +			status = "okay";
> +
> +			phys =	<&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-0}>,
> +				<&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-1}>,
> +				<&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-2}>,
> +				<&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-3}>,
> +				<&{/bus@0/padctl@3520000/pads/usb3/lanes/usb3-0}>,
> +				<&{/bus@0/padctl@3520000/pads/usb3/lanes/usb3-1}>,
> +				<&{/bus@0/padctl@3520000/pads/usb3/lanes/usb3-2}>;
> +			phy-names = "usb2-0", "usb2-1", "usb2-2", "usb2-3",
> +				"usb3-0", "usb3-1", "usb3-2";
> +		};
> +
> +		i2c@c240000 {
> +			status = "okay";
> +			ucsi_ccg: ucsi_ccg@8 {

No underscores in node names.

> +				compatible = "cypress,cypd4226";
> +				cypress,firmware-build = "gn";
> +				interrupt-parent = <&gpio>;
> +				interrupts = <TEGRA234_MAIN_GPIO(Y, 4) IRQ_TYPE_LEVEL_LOW>;
> +				reg = <0x08>;
> +				status = "okay";

The pattern of redefining full path in Tegra is confusing - I have no
clue which of these status=okay are correct which are redundant.

Do you?



> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				ccg_typec_con0: connector@0 {
> +					compatible = "usb-c-connector";
> +					reg = <0>;
> +					label = "USB-C";
> +					data-role = "host";
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					port@0 {
> +						reg = <0>;
> +						#address-cells = <1>;
> +						#size-cells = <0>;

Hm, why do you have here cells?

Did you test the DTS with dtbs_check?

Best regards,
Krzysztof

