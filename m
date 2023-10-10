Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80F647BFE75
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Oct 2023 15:53:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232599AbjJJNwu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Oct 2023 09:52:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232663AbjJJNwl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 Oct 2023 09:52:41 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CEF726BA;
        Tue, 10 Oct 2023 06:45:18 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6969b391791so3880912b3a.3;
        Tue, 10 Oct 2023 06:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696945517; x=1697550317; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8l2RdI3GFEPsUV4izDgB+ReS+fUuBzrkfgodsUfx59E=;
        b=NEZaRF6XdarTyqq7WhTh6Ppmj3rHgDi3u42y0blJQvIp6q9r5inkGCvDUZGKAdwFxB
         6b4Raag+FyX9wSDgjGX/gpnDxVvZxGxvBueAQMrgDm27a8LOV4m7xjIXU4WYxkXaSH5s
         H7/v6ASKspCPgVc7aJcyBssNtzSgWby8Aj5TNoZjo259Hjx1JVig/QfRkOBJZEc9fw0I
         t6E863ANh+LMGgPjbuu8xm8DOITRV7dpc1MZYLBFW0tMjwg92Tf2lkdnFM2MxhMoCfHT
         3yh6lFnaVFD7A7v/QeCZKsnsmvmfRX4MqfgBpFhnxEGopoHmIEfHD/K/7wbcJBXpM8Wv
         Vrmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696945517; x=1697550317;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:sender:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8l2RdI3GFEPsUV4izDgB+ReS+fUuBzrkfgodsUfx59E=;
        b=WUvauxw2JQxzwpexGR8MIo90ujj3+kQLnuhwShnyMUlgbevhd8me99v81Zwutg+ezZ
         ZWigJp+Drmhk5hpdWGaP4TYrLqCYrzu/TnZcxn7rVdpTodJ8mdKeU5HPKLq7T75bCSpR
         ms8s6NZW+EQqVkYsXFJDNLBLbZh9/oQJxOP0xWA7ySd7X/PHOuo6miIVpowbu6sWipdB
         zEgUChUSv9BrkyRyBs6/LKvd3ZsZM/Svm49xsIeqp8A0DLyWdhB7s92+LqFTZDCL8Yze
         jvlGQpzToZnGkbpMJGWr3saZnvWKFqqYnk0pFkw/bSONGRAUtbxAfaNasOK7v6jw5eyc
         yoKg==
X-Gm-Message-State: AOJu0YwZ6vjynDnCqesrGeZX8/4tGK/Wdl9COKH0H43vMuCTYAq2BXdk
        ppXaW+4iJczjO47iCSHiHbA=
X-Google-Smtp-Source: AGHT+IFXY9oUPaVxKEnn6g6JYYGtzSzrMoSdMofrv/KTOwLE9fLvIeTEWiBIFB3Tz8IdPnDmUMrc6Q==
X-Received: by 2002:a05:6a20:2451:b0:14d:5580:8ff0 with SMTP id t17-20020a056a20245100b0014d55808ff0mr18099934pzc.25.1696945517276;
        Tue, 10 Oct 2023 06:45:17 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j6-20020aa783c6000000b0068ffb8da107sm8231769pfn.212.2023.10.10.06.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 06:45:16 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 10 Oct 2023 06:45:15 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Wolfram Sang <wsa@kernel.org>,
        Lakshmi Yadlapati <lakshmiy@us.ibm.com>,
        sumit.semwal@linaro.org, christian.koenig@amd.com,
        jdelvare@suse.com, joel@jms.id.au, andrew@aj.id.au,
        eajames@linux.ibm.com, ninad@linux.ibm.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-hwmon@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v1 0/2] [PATCH] hwmon: (pmbus/max31785) Add minimum delay
 between bus accesses
Message-ID: <1284830f-025e-4e25-8ed0-50a6cc00d223@roeck-us.net>
References: <20231009211420.3454026-1-lakshmiy@us.ibm.com>
 <ZSUaDIfWmEn5edrE@shikoro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZSUaDIfWmEn5edrE@shikoro>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Oct 10, 2023 at 11:31:56AM +0200, Wolfram Sang wrote:
> Hi,
> 
> thanks for this series!
> 
> > Reference to Andrew's previous proposal:
> > https://lore.kernel.org/all/20200914122811.3295678-1-andrew@aj.id.au/
> 
> I do totally agree with Guenter's comment[1], though. This just affects
> a few drivers and this patch is way too intrusive for the I2C core. The
> later suggested prepare_device() callback[2] sounds better to me. I
> still haven't fully understood why this all cannot be handled in the
> driver's probe. Could someone give me a small summary about that?
> 

Lots of PMBus devices have the same problem, we have always handled
it in PMBus drivers by implementing local wait code, and your references
point that out. What other summary are you looking for ?

On a side note, if anyone plans to implement the prepare_device() callback,
please make sure that it covers all requirements. It would be unfortunate
if such a callback was implemented if that would still require per-driver
code (besides the callback).

Thanks,
Guenter
