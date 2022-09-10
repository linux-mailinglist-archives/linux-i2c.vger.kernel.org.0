Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB1F05B439F
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Sep 2022 03:25:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229550AbiIJBZ2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Sep 2022 21:25:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229685AbiIJBZ1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 9 Sep 2022 21:25:27 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18CDED51C2;
        Fri,  9 Sep 2022 18:25:25 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id p18so3315007plr.8;
        Fri, 09 Sep 2022 18:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=WPkdHl1yt9PzJcQYT1ZlcZpPo36zcYv9PzIsB0gZJUc=;
        b=mnLaMergEj/Tsg89pTKXLV9RqD764uz6uc0EeOe+iu+xOVi1jazKd6H641oL7BrTco
         1HWi643ndEzW4+GdadNt/x6DVVFszhgGgwjqf3+YP9tWZsWOPGiPMwr4pDrdXizc/qsq
         jIsjBkA99OJW/TXF9cA6OwBLJAOzsGOj2+JOVTAJVshU5LPIsjFlvoBvQo9UpTOxTGJt
         MFFvVHS2PJQ0XbXpywKc14SnZjB0v+BB+CrL7FSSGcvL+TM+RSvUWtDtckvjA6/KWXrG
         zk9T+kf1iVIz/Acv8Ovqdb6lsZbJV0McP3btvh90VJcDX0amgFd7zuGGpsH4MJRBkOMo
         KMYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=WPkdHl1yt9PzJcQYT1ZlcZpPo36zcYv9PzIsB0gZJUc=;
        b=Hk9KNUQ0Q4iFYo3a2EtyhTXgX+i4j8R6A7OEZYP7FDIUQTgMJKZJkaRutZP72CRKpW
         GkWErhrhX0MCz86eeVjk6jR7VnICbJfM769eXTs4EIh4gKrANwgXq+fhcYGUHYm2jzvi
         iTNuFdG5BA+PgZ1Bfky4ktBmpJfGLuXdL0RCcs3o22AWwzc3uSnrjcmY5MjcSJtmHVTj
         xzw7wjShpWn1jITJ8L47Z0kXLpeqcRHOMwFLWBEgehzaI/nnW4AtrFvER79PYkxqC0ER
         FLC63p6KFxtuTRx0pZhRsHJ9x3qWBlRAPiFIgb7EWIFaHCVxSswMOnIyOOvw0feCRASD
         mYdQ==
X-Gm-Message-State: ACgBeo1x74OKfFlR5xxpQ4t8dmV9+DrVyuyIQXhZWfRJ43tDZcyeqi1I
        otDJ7PU10WW2Kf8Lg4/Q+Nw=
X-Google-Smtp-Source: AA6agR45zQhDWAvjo+d4QWTBsluXtwX82Rdp/aHlqLZpPuD1QSJ9LXKlEY0VZgpwxXoEVpyqwpLzww==
X-Received: by 2002:a17:902:b684:b0:172:d9f4:e511 with SMTP id c4-20020a170902b68400b00172d9f4e511mr16193726pls.107.1662773124387;
        Fri, 09 Sep 2022 18:25:24 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:42:358d:7d2e:b1e])
        by smtp.gmail.com with ESMTPSA id c12-20020aa7952c000000b0052e987c64efsm386644pfp.174.2022.09.09.18.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 18:25:23 -0700 (PDT)
Date:   Fri, 9 Sep 2022 18:25:20 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Raul Rangel <rrangel@chromium.org>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Linux ACPI <linux-acpi@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        "Limonciello, Mario" <mario.limonciello@amd.com>,
        Tim Van Patten <timvp@google.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/8] i2c: acpi: Use ACPI GPIO wake capability bit to set
 wake_irq
Message-ID: <YxvngIKCXUieZfxC@google.com>
References: <20220830231541.1135813-1-rrangel@chromium.org>
 <20220830171332.4.I8af4282adc72eb9f247adcd03676a43893a020a6@changeid>
 <YxftNQrRx3fwsobk@google.com>
 <CAHQZ30DPmn1hN+xfck7CgOGLcze0jtHxxWnq7yVVL0Q_DzG6UQ@mail.gmail.com>
 <98559c23-cc22-3b85-2102-0cc760240804@redhat.com>
 <CAHQZ30ACZ-1UtgbXwEc+tFRvW-KpDg87Q4nj5Dwysz2BB26yiQ@mail.gmail.com>
 <CAJZ5v0iyF98fBgGFyvj_huVkyKvn4O0_WhA=-wC2VCG6A4DdjQ@mail.gmail.com>
 <CAHQZ30DY9aYBoW303qW+hkegYV0BbKFO6LkCuHKnHNxZ3QoLYw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHQZ30DY9aYBoW303qW+hkegYV0BbKFO6LkCuHKnHNxZ3QoLYw@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Sep 09, 2022 at 12:47:11PM -0600, Raul Rangel wrote:
> It looks like `i2c_acpi_get_irq` and `platform_get_irq_optional` are
> doing pretty much the same thing. Can we replace `i2c_acpi_get_irq`
> and switch over to `platform_get_irq_optional`? Is it possible to get
> a `platform_device` from an `i2c_client`?

No, they are completely different objects.


		struct device
	/		|		\
platform_device		i2c_client	spi_device ...

Also, please no top-posting on kernel mailing lists.

Thanks.

-- 
Dmitry
