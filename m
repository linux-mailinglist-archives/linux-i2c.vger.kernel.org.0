Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BA29575755
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Jul 2022 00:04:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241018AbiGNWEL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 14 Jul 2022 18:04:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241005AbiGNWEI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 14 Jul 2022 18:04:08 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F4E161B22
        for <linux-i2c@vger.kernel.org>; Thu, 14 Jul 2022 15:04:07 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id g17so1617084plh.2
        for <linux-i2c@vger.kernel.org>; Thu, 14 Jul 2022 15:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=ywlJHcH7eypqCmP7zkmcLFhr+R1MKhJyHDg1SQdZ4+o=;
        b=XvB9r9RXYlimHyg2tVGdZjZabKYGLze7MOQPJOwXRsyTNAMc+T8JkFwn9DHK0rw+FN
         HBskxc3t+diLtZDeNPgT+DZIGRaT1TSLFqyOwNkawLVwR3fLGPO+1Att1oH2ea16v0VM
         xCucMDs0YeZdbPd3NzMPMWCqZx+U06K3UzY0UKpjpErOo2MsAvIDIe+JvY+dA3CoQTaO
         8RZAwgJDlw8wDWcr26G6exu7MCkxZ+2O+9ZEpxeKC+5OgZgwv/di6+1KZ/I7BTfpzUkR
         6keniU94SgAhkc4npYoyHxM985UTjTFhpiqnl1ekmrGy4LPfqeNFS7qEJS25AFm2VnhA
         H29Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=ywlJHcH7eypqCmP7zkmcLFhr+R1MKhJyHDg1SQdZ4+o=;
        b=dmLGdDpRbeQxftlw3U43Nwm/vt1LujRq5BF7DnQiC/x7DnXgmyLd+lebeZEvNOlu5O
         ek8ewjhwBkpzLS9PzFhexHQmLkZWiAScFvFGyS0sZBtlJYeIIonZeXMy3tmcRBTMDf+r
         75FeCME2CGRvxMXwyXmNLvVjQ2QZGnmVfyhbhc+/yU8L9fQv9AF88AZsnhtyARrip2Bo
         SU1JpRkF0t7cf8KE9+CyEX31+LNM2b07Cg8YpyEIiO+ULOHv7gWDoJTfSC+uv0+0mbk5
         A4abynM65LE9LSQibnsF0kcNcqMOYozCSqeIScyjgK9cbZpafdgR8U/H55a6FXuZOEvt
         BdSA==
X-Gm-Message-State: AJIora9+eEvpgJCNmsEsp5Y0lEjNkI4nWCFQ6yuxPHnD5VUI73LXVWH8
        34Q5frTOi3BaZ6TZYjHnU8RDKQ==
X-Google-Smtp-Source: AGRyM1thP0N/IY4OLhYu9r6MjJ1HW8omCP9Uxv0y7tA8fStUOLH0EhhBVNxOBpyHqtol460Zk/Y6bA==
X-Received: by 2002:a17:902:f68c:b0:16c:4eb6:913c with SMTP id l12-20020a170902f68c00b0016c4eb6913cmr10065283plg.2.1657836246537;
        Thu, 14 Jul 2022 15:04:06 -0700 (PDT)
Received: from localhost ([50.221.140.186])
        by smtp.gmail.com with ESMTPSA id r11-20020a170903410b00b0016c5306917fsm1927472pld.53.2022.07.14.15.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 15:04:05 -0700 (PDT)
Date:   Thu, 14 Jul 2022 15:04:05 -0700 (PDT)
X-Google-Original-Date: Thu, 14 Jul 2022 14:46:55 PDT (-0700)
Subject:     Re: [PATCH v3 4/4] riscv: dts: sifive: "fix" pmic watchdog node name
In-Reply-To: <20220606201343.514391-5-mail@conchuod.ie>
CC:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        andrew@lunn.ch, support.opensource@diasemi.com,
        lee.jones@linaro.org, ulf.hansson@linaro.org,
        Paul Walmsley <paul.walmsley@sifive.com>,
        aou@eecs.berkeley.edu, stwiss.opensource@diasemi.com,
        conor.dooley@microchip.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-riscv@lists.infradead.org,
        atulkhare@rivosinc.com, krzysztof.kozlowski@linaro.org
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     mail@conchuod.ie
Message-ID: <mhng-91bfbf9d-d8cc-4642-9688-20ef7ab21512@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 06 Jun 2022 13:13:44 PDT (-0700), mail@conchuod.ie wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> After converting the pmic watchdog binding to yaml, dtbs_check complains
> that the node name doesn't match the binding. "Fix" it.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
> index c4ed9efdff03..1f386b07a832 100644
> --- a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
> +++ b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
> @@ -90,7 +90,7 @@ rtc {
>  			compatible = "dlg,da9063-rtc";
>  		};
>
> -		wdt {
> +		watchdog {
>  			compatible = "dlg,da9063-watchdog";
>  		};

Thanks, this is on for-next.
