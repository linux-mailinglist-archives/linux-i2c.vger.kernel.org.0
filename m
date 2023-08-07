Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAEFB773065
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Aug 2023 22:37:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230207AbjHGUhU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Aug 2023 16:37:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230216AbjHGUhS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Aug 2023 16:37:18 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09B7210D8;
        Mon,  7 Aug 2023 13:37:17 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-686be28e1a8so3436754b3a.0;
        Mon, 07 Aug 2023 13:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691440636; x=1692045436;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AkcdWxF3VIdhdBqAc/Bhm/xZMNeQwoh34ermhL900ts=;
        b=RnphY0FF1I8cEjADWD2ipjXR41GSVVD/m3MOYoNXgmtqBPVo5ZL6xfTJOs2hNAB3/2
         wkIQr2odC0loOJ4PQbMi7egm6nLFpjS1KtvQZI1vJ1qsZoDzcVF6BKl9Ms0Rdeqta/Nd
         gRE5ZjCVV+lZUm2WpsABFsPPG7bnfxXUErJomoz+AgWEVWmGg6kg7gFHtwWeV0NaSsmA
         TBl7fhl4bndUA1VM8AfWCboJQfaGvUiff4rotdXaYVA+1NhTMGNGCkWuxTk8My6QdHb9
         15ZozFSnRRGaX8Mnrmc7vI9B70ArcYEMGgBKl4OpRtGkfJnYBup1G39F0WJdyByFfQ9j
         Nthg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691440636; x=1692045436;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AkcdWxF3VIdhdBqAc/Bhm/xZMNeQwoh34ermhL900ts=;
        b=WhaOpSnb0t7X/prFFkKd51B6QQrAaZCgTbNL5moSq1ESHL6BFuA7WtO+ZVAFHiBZhM
         6q/7mP+lrxLNvQ/cgl4wdsQxn5C+JHOoyq5r2RktIIYjG6x6g4k2jXHvNyYoOwkOApCQ
         DD74gvq2kRJplcDWV2ueYSOhR1S01fh4BC2uo20dqiMgV2pjuRVGksd+bZ/dVA0KY7N/
         pUCD5zcNxKwuxLLjeLUBac3MmnB8okpckPvyKrXaHZClRG+ujb1cgTRWwIj306Subx9h
         U+CDm0Vj7c1REnPxVOFuUzbhdHgghTQKIbagNtMBiLrdNDXANef6TJT2OinOIzmkZ2vi
         avCg==
X-Gm-Message-State: AOJu0YwWXB+ryHzDCAwBfGMUG1QQ3YrwCzG30ybSXYd7sQVjSDoHi371
        RRTlbj6opsl0dwxZtVDfEe+gaWVK3U0=
X-Google-Smtp-Source: AGHT+IEKmK0BmgKPBT2it75tXWkSx8ysqKgPxFAxn0DZjPXZB2zhCP3ectLWjEtdLMTNXlOjUs6WEA==
X-Received: by 2002:a05:6a00:1828:b0:687:8417:ab51 with SMTP id y40-20020a056a00182800b006878417ab51mr10737572pfa.8.1691440636312;
        Mon, 07 Aug 2023 13:37:16 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:b0a6:8f72:5b50:cfc])
        by smtp.gmail.com with ESMTPSA id s8-20020aa78d48000000b006873aa079aasm6808889pfe.171.2023.08.07.13.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 13:37:15 -0700 (PDT)
Date:   Mon, 7 Aug 2023 13:37:12 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Jonathan Cameron <jic23@kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v7 0/4] Extend device_get_match_data() to struct bus_type
Message-ID: <ZNFV+C1HCIRJpbdC@google.com>
References: <20230804161728.394920-1-biju.das.jz@bp.renesas.com>
 <20230805174036.129ffbc2@jic23-huawei>
 <OS0PR01MB59220491C7C8AA40BEFAAD82860EA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230806142950.6c409600@jic23-huawei>
 <ZNEFjyAloqlkMWn7@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZNEFjyAloqlkMWn7@smile.fi.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FSL_HELO_FAKE,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Aug 07, 2023 at 05:54:07PM +0300, Andy Shevchenko wrote:
> On Sun, Aug 06, 2023 at 02:29:50PM +0100, Jonathan Cameron wrote:
> > On Sat, 5 Aug 2023 17:42:21 +0000
> > Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > > On Fri,  4 Aug 2023 17:17:24 +0100
> > > > Biju Das <biju.das.jz@bp.renesas.com> wrote:
> 
> ...
> 
> > > + * Besides the fact that some drivers abuse the device ID driver_data type
> > > + * and claim it to be integer, for the bus specific ID tables the driver_data
> > > + * may be defined as kernel_ulong_t. For these tables 0 is a valid response,
> > > + * but not for this function. It's recommended to convert those either to avoid
> > > + * 0 or use a real pointer to the predefined driver data.
> 
> > We still need to maintain consistency across the two tables, which
> > is a stronger requirement than avoiding 0.
> 
> True. Any suggestion how to amend the above comment? Because the documentation
> makes sense on its own (may be split from the series?).
> 
> > Some drivers already do that by forcing the enum used to start at 1 which
> > doesn't solver the different data types issue.
> 
> And some maintainers do not want to see non-enum values in i2c ID table.
> *Shrug*.

So in legacy ID lookup path we can safely assume that values below 4096
are scalars and return NULL from the new device_get_match_data(). This
way current drivers using the values as indices or doing direct
comparisons against them can continue doing manual look up and using
them as they see fit. And we can convert the drivers at our leisure.

Thanks.

-- 
Dmitry
