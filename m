Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97C2C439500
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Oct 2021 13:41:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233102AbhJYLoA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 25 Oct 2021 07:44:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232207AbhJYLn5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 25 Oct 2021 07:43:57 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B5DFC061745;
        Mon, 25 Oct 2021 04:41:35 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id g8so10320150edb.2;
        Mon, 25 Oct 2021 04:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Af+qmYvV3PY7oY9iMHf1WDLN+yTC/dfVl6LmNB2Ru+M=;
        b=iLTzGHKq62wcRXJw/NQeb8QVl0SSGxd0VOXTRXyEMYtWDF16J/H4D9o1cX+9caqz8h
         pXrPyzBaUiZ0wa/rRI5QqSYx28CxRd1p5Ys03yoYaNBgm3qYTV80XOmaEFCOc8WN3eI+
         /Zwrh18K9RiH6f4EmIOxd9zjwFUeuIeq/GdpkLulr84hMeotFMMfUuWWmc1F0lnxsvey
         1wozSc9mRa+aSgqBIsqi3KeUU16h2VN8zp5sptzJqmma4Ljkt5BOEK3yDYNWT89byf7X
         cX9CfI4culRu/NEpETmT2OCUXcdXtWlLT82RGyimdnOIp4g0iEyt3U8uwefzVYNDGf9/
         VyeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Af+qmYvV3PY7oY9iMHf1WDLN+yTC/dfVl6LmNB2Ru+M=;
        b=UUfPSHY/5GTlh7vNnngmfbwcsOt1bbIg3kAuA7pAdr+5yiWD+5apss0uaJI76lIM0B
         PZNlk+dFc68optixYEHjIqKAyILm+RYyPEpMXWQ1Tb13icpyy9tzLG042Y/VZ/JtZLBj
         AZzJhiDwiefr//OvgpmAuy96rWNR++eWXf6MBy2DbhgqhgN3M8z84jozTE3JHJwIKaXi
         f6ONyxx/qZpx8+Uwm0kOIn9Go5HjvbCVJjFg0HJW93gFp6sWMbRjCW4fYssGvWltrRmy
         8UdxH94gs4NyNN4pffRPyXicaJwVUI7+ocgYLLVt14J9AeCQKDVP+8RLV4bG+8DcQafQ
         aadw==
X-Gm-Message-State: AOAM532wd7W+KrnWTlLjEnCsLZLCJmsW7oqOtBK8pUNvMRulJG3xTnhE
        yHSacVq8seR56o2Xe1L4jRZLNbzZQxllRv5/bb0=
X-Google-Smtp-Source: ABdhPJzjBN4K07mgHexd4fWyTF3MfP5LCSNqxjtFEIj1rgPmmarKsiTdhxurgICUQfmRRjgJ3XTV28Ui7aDLiZxfOA8=
X-Received: by 2002:a17:906:d553:: with SMTP id cr19mr14340955ejc.128.1635162093757;
 Mon, 25 Oct 2021 04:41:33 -0700 (PDT)
MIME-Version: 1.0
References: <20211025094119.82967-1-hdegoede@redhat.com> <20211025094119.82967-12-hdegoede@redhat.com>
In-Reply-To: <20211025094119.82967-12-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 25 Oct 2021 14:40:39 +0300
Message-ID: <CAHp75VdJav6L03oVNd0DNA8jUXHPaqNzHU+q=+2-eEbh087bOQ@mail.gmail.com>
Subject: Re: [PATCH v4 11/11] platform/x86: int3472: Deal with probe ordering issues
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Len Brown <lenb@kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Oct 25, 2021 at 12:42 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> The clk and regulator frameworks expect clk/regulator consumer-devices
> to have info about the consumed clks/regulators described in the device's
> fw_node.
>
> To work around this info missing from the ACPI tables on devices where
> the int3472 driver is used, the int3472 MFD-cell drivers attach info about
> consumers to the clks/regulators when registering these.
>
> This causes problems with the probe ordering wrt drivers for consumers
> of these clks/regulators. Since the lookups are only registered when the
> provider-driver binds, trying to get these clks/regulators before then
> results in a -ENOENT error for clks and a dummy regulator for regulators.
>
> All the sensor ACPI fw-nodes have a _DEP dependency on the INT3472 ACPI
> fw-node, so to work around these probe ordering issues the ACPI core /
> i2c-code does not instantiate the I2C-clients for any ACPI devices
> which have a _DEP dependency on an INT3472 ACPI device until all
> _DEP-s are met.
>
> This relies on acpi_dev_clear_dependencies() getting called by the driver
> for the _DEP-s when they are ready, add a acpi_dev_clear_dependencies()
> call to the discrete.c probe code.
>
> In the tps68470 case calling acpi_dev_clear_dependencies() is already done
> by the acpi_gpiochip_add() call done by the driver for the GPIO MFD cell
> (The GPIO cell is deliberately the last cell created to make sure the
> clk + regulator cells are already instantiated when this happens).
>
> However for proper probe ordering, the clk/regulator cells must not just
> be instantiated the must be fully ready (the clks + regulators must be
> registered with their subsystems).
>
> Add MODULE_SOFTDEP dependencies for the clk and regulator drivers for
> the instantiated MFD-cells so that these are loaded before us and so
> that they bind immediately when the platform-devs are instantiated.

Just a side note: MODULE_SOFTDEP() won't work in some (special?) cases
when module tools are limited in functionality (e.g. busybox
implementation as of today).

-- 
With Best Regards,
Andy Shevchenko
