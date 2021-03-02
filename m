Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47BDC32B120
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Mar 2021 04:46:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233366AbhCCBIM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 2 Mar 2021 20:08:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242826AbhCBDor (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 1 Mar 2021 22:44:47 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BF13C0617AA
        for <linux-i2c@vger.kernel.org>; Mon,  1 Mar 2021 19:44:44 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id t29so12938321pfg.11
        for <linux-i2c@vger.kernel.org>; Mon, 01 Mar 2021 19:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=6ocpLpD/YC8p2XAnodhqPke9yP3AITZZa1l575H6MVw=;
        b=JHRHOhgiaoddDWynTZrpm0LW4LFDXMQcRKcMcbdOJtmyfINwmNDmZaMLymueC48zTF
         LXjl5N8e8EOpVd1LA5MbOCgSlxkj1RdR2BeQM6PI5jAgFWEm7XBADNEzXblAl9KqDfDi
         PuTLvXSY63nOrAGOOCChUi0melOu/i/F+YJ15x0bo0t+RP0sMtujH7oEcHRuiCexKX1m
         hvpQ4OVX15bWs6b2Nq3+l1fkBIJcEoA7Z4rJJy0RyXkdYpbwOF7q1LXvIUMqeLmnDqFT
         u51n3nxiN4UR94MMNwleVgVd6peH3XMEfodhWsISfD9FlpHhIae/MdRoLXtPEUzVnJ22
         XUzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=6ocpLpD/YC8p2XAnodhqPke9yP3AITZZa1l575H6MVw=;
        b=b7xQL5rXgG0vp8s8sZBzIEArYPaWDkWsWAIhilyxzqzuDGT70ezhUW2gUniUE4+1uL
         T2zpbryajoD9lU617tycsQzQHdmmN1lDP8x72NRD+7HYGri+RzqFFHXzL8SM6aoc6cs8
         iK+Jld5wWWqvTa2D8MLurJ2JXc04Ghylo4gRWyejyvuHtEQHfHyI4/yXgk47oyjk1yNA
         47FVgh3sHL++QNAOfij24QKk0GfHH+TPzoH3LMcbg+4SMlFiuRzvpm7d0yatwunJ6VDm
         OO2B3zbnEJBDXvf9WbvacPwX64l8TGWa4UtXD8ZOmDL0m55Ki0YhAnmk4pxf9HkYVwMc
         iNEg==
X-Gm-Message-State: AOAM531YT5ECMwsBt36GZF5BDPv6G5PO6fsMdC9Zu08ci1EWAt6SuNCZ
        MhOISJIa1OKS3qVNUdpJKHBX/Q==
X-Google-Smtp-Source: ABdhPJx/Q+oofnFLde6CKHvTI9rHRmh2kqI4wTqTF5wpOq8Djwac9vMGULsXLHbE4mwfBcRp/551Ww==
X-Received: by 2002:a63:374f:: with SMTP id g15mr16584551pgn.212.1614656684033;
        Mon, 01 Mar 2021 19:44:44 -0800 (PST)
Received: from localhost ([122.171.124.15])
        by smtp.gmail.com with ESMTPSA id l19sm1018928pjt.16.2021.03.01.19.44.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Mar 2021 19:44:43 -0800 (PST)
Date:   Tue, 2 Mar 2021 09:14:41 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Jie Deng <jie.deng@intel.com>, linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, mst@redhat.com, wsa@kernel.org,
        jasowang@redhat.com, wsa+renesas@sang-engineering.com,
        conghui.chen@intel.com, arnd@arndb.de, kblaiech@mellanox.com,
        jarkko.nikula@linux.intel.com, Sergey.Semin@baikalelectronics.ru,
        rppt@kernel.org, loic.poulain@linaro.org, tali.perry1@gmail.com,
        u.kleine-koenig@pengutronix.de, bjorn.andersson@linaro.org,
        yu1.wang@intel.com, shuo.a.liu@intel.com
Subject: Re: [PATCH v5] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <20210302034441.dcmrx4ughbtusolg@vireshk-i7>
References: <00f826ffe1b6b4f5fb41de2b55ad6b8783b7ff45.1614579846.git.jie.deng@intel.com>
 <20210301115441.a4s5xzwm6d6ohz7f@vireshk-i7>
 <YDzZdc9+6hEvIDS1@smile.fi.intel.com>
 <YDzZocYCA8UC1FCW@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YDzZocYCA8UC1FCW@smile.fi.intel.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 01-03-21, 14:10, Andy Shevchenko wrote:
> On Mon, Mar 01, 2021 at 02:09:25PM +0200, Andy Shevchenko wrote:
> > On Mon, Mar 01, 2021 at 05:24:41PM +0530, Viresh Kumar wrote:
> > > On 01-03-21, 14:41, Jie Deng wrote:
> > > > +/**
> > > > + * struct virtio_i2c_req - the virtio I2C request structure
> > > > + * @out_hdr: the OUT header of the virtio I2C message
> > > > + * @write_buf: contains one I2C segment being written to the device
> > > > + * @read_buf: contains one I2C segment being read from the device
> > > > + * @in_hdr: the IN header of the virtio I2C message
> > > > + */
> > > > +struct virtio_i2c_req {
> > > > +	struct virtio_i2c_out_hdr out_hdr;
> > > > +	u8 *write_buf;
> > > > +	u8 *read_buf;
> > > > +	struct virtio_i2c_in_hdr in_hdr;
> > > > +};
> > > 
> > > I am not able to appreciate the use of write/read bufs here as we
> > > aren't trying to read/write data in the same transaction. Why do we
> > > have two bufs here as well as in specs ?
> > 
> > I²C and SMBus support bidirectional transfers as well. I think two buffers is
> > the right thing to do.
> 
> Strictly speaking "half duplex".

Half duplex is what this driver implemented, i.e. only one side can
send a msg at once, we don't need two buffers for that for sure.

Though we need two buffers if we are ever going to support full
duplex.

-- 
viresh
