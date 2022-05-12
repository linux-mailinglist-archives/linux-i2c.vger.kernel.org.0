Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAA0C52497B
	for <lists+linux-i2c@lfdr.de>; Thu, 12 May 2022 11:53:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352309AbiELJxw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 12 May 2022 05:53:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352320AbiELJxr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 12 May 2022 05:53:47 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2C6B427C5
        for <linux-i2c@vger.kernel.org>; Thu, 12 May 2022 02:53:45 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id n126-20020a1c2784000000b0038e8af3e788so2673183wmn.1
        for <linux-i2c@vger.kernel.org>; Thu, 12 May 2022 02:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=36WnFUDNUVrLnebw8e2rXDDHxmNPW9lYWYZDRw2VWIc=;
        b=wItM0zhGx7UzmwBKHTcTNSfo6Gq3orFWBR5BIn2yY69ledPGEX5cdPMw/CjKLUonw1
         VW6ImWsa4Tgl6WMGhWiArwkcvEm+bubsIfJzl+XouMoj/ahYklsOtVjX2+kzBTMMZvVs
         wI24LeMLt/Njzl5+4+MSimffTiYgguNRSwX4X2zewUOO83l3pFiwdFtjPAX9jNSDJDXL
         zq5/NAY98iB7sljIHtDqmb03G+2P0Eqv94aZOQNUDtd5UFX+ntNlQs8uDgd4v57hd7OW
         XAQb3WtzZNIg4cu9//2PIO+eQbn+NnwxgsxrVe2c2sJWrSiQ93pFX5DTFp9k0diNbzJ9
         c+dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=36WnFUDNUVrLnebw8e2rXDDHxmNPW9lYWYZDRw2VWIc=;
        b=oMZ5Htf5d2T9UA/29BIO+PGkKyiUP9Mbyhkh3oCU6GLLzoXqozFyUneA9VfN9fziIz
         DB/0VmVSeOOvSCLcAkZx2+3xUavSIiI3v8qNN9S9mlghESQP+zsPyzHFlUnxWxjeZULU
         NxaksfMWXo6x9+k/urgycr+pkejmuY7P6ntDsXnLETNqUbzjJ/5uar6eIis8HWlVhkd5
         fbAusahVq9qd7kiriTEHU3HbjP6X/iINnGD+iuMNJMqP8I3zQN2q1Bs6HtGgwWDg56o1
         nLMlti0nj6RoNL/siXdNrNqJ3xBLJrtjsuRT8Lagrx53+hPR7PBEtRXy/41Le5F4nV+j
         hzNQ==
X-Gm-Message-State: AOAM5315ZUELOuTlnUuoiaXqsUnw6rvWIlwhsH+VBR+AHJtTXX1S9/k+
        1kwiDtRvykMlkcWcqdPvJq1JsA==
X-Google-Smtp-Source: ABdhPJyiH+vmHLZHTmxMQfShNBwbUwLOV82INmXxyFQwcXdIF90tUO/KPbJe4l2fiAUfICToHf26tg==
X-Received: by 2002:a1c:5415:0:b0:394:2c89:4f2a with SMTP id i21-20020a1c5415000000b003942c894f2amr9282931wmb.144.1652349224349;
        Thu, 12 May 2022 02:53:44 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id f15-20020a056000128f00b0020c5253d8dbsm3080302wrx.39.2022.05.12.02.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 02:53:43 -0700 (PDT)
Date:   Thu, 12 May 2022 10:53:41 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Tony Luck <tony.luck@intel.com>, Wolfram Sang <wsa@kernel.org>,
        Jean Delvare <jdelvare@suse.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        =?utf-8?Q?=C5=81ukasz?= Bartosik <lb@semihalf.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Yong <jonathan.yong@intel.com>,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Borislav Petkov <bp@alien8.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        James Morse <james.morse@arm.com>,
        Robert Richter <rric@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Peter Tyser <ptyser@xes-inc.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Mark Gross <markgross@kernel.org>,
        Tan Jui Nee <jui.nee.tan@intel.com>,
        Henning Schild <henning.schild@siemens.com>
Subject: Re: [PATCH v5 5/8] mfd: lpc_ich: Add support for pinctrl in non-ACPI
 system
Message-ID: <YnzZJaS+ZISAZfh5@google.com>
References: <20220510151451.85561-1-andriy.shevchenko@linux.intel.com>
 <20220510151451.85561-6-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220510151451.85561-6-andriy.shevchenko@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 10 May 2022, Andy Shevchenko wrote:

> From: Tan Jui Nee <jui.nee.tan@intel.com>
> 
> Add support for non-ACPI systems, such as system that uses
> Advanced Boot Loader (ABL) whereby a platform device has to be created
> in order to bind with pin control and GPIO.
> 
> At the moment, Intel Apollo Lake In-Vehicle Infotainment (IVI) system
> requires a driver to hide and unhide P2SB to lookup P2SB BAR and pass
> the PCI BAR address to GPIO.
> 
> Signed-off-by: Tan Jui Nee <jui.nee.tan@intel.com>
> Co-developed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Tested-by: Henning Schild <henning.schild@siemens.com>
> Acked-by: Hans de Goede <hdegoede@redhat.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/mfd/lpc_ich.c | 105 +++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 104 insertions(+), 1 deletion(-)

For my own reference (apply this as-is to your sign-off block):

  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
