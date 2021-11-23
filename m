Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4356445A300
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Nov 2021 13:44:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233349AbhKWMrZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Nov 2021 07:47:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233097AbhKWMrZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 23 Nov 2021 07:47:25 -0500
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83D7FC061574;
        Tue, 23 Nov 2021 04:44:17 -0800 (PST)
Received: by mail-qv1-xf32.google.com with SMTP id v2so14794274qve.11;
        Tue, 23 Nov 2021 04:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:subject:message-id:reply-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=LbwUcvtgCI0ypL8cCTzZvy056vLLLK35SiwyeUQiMkE=;
        b=At+LDs6rrG3Gtq3GOOqTmEMgAaDi745BC8F0H9jcWP+D8NxFlo+5pyK8GdZltu5lzi
         oPjSKbRQK+9PetkV5Roo6CvXwRC2RjXKDEHtgO/YaeloarfAAoMLCEPUSUV5BelL05f9
         CQEXAI3b+DAzkiaAFBZGGfmCKaPGKoTUFaYlCYdYXEzhu47O8eEGzeBTfwHLDbO1KwH5
         Bn1DaqBZUrL/82DJXuhFiMcWMEJwLS6/y8flzqz5E1Y3xnfe57a94jKCCfYQheQcqVcx
         Ci43Std4PY60EgPwMaIf7duvna/HY7DzaC6MP3P1oNZ50C4i9A3o+TzgSF2qnpPs2hu6
         7PhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to;
        bh=LbwUcvtgCI0ypL8cCTzZvy056vLLLK35SiwyeUQiMkE=;
        b=sSLtZpPEkucDWs7qg+Fa0AUucibtPgsQfbrQzKVlZBDBf0mgf7yhKvJZCWyrUZqwHG
         b1mZEYr7FtqWHmusSV87zPyW7i2iMJOXmJ3Zg56EoenPKNVf+4ZKSuOyynGig4MVB1I8
         TL8soHKNDDSVKnjj1/Hk0dxk6vjuDcT9OTzA7W/2x7yoIewgsjkDZAGTBk4+wM1PXDn2
         cCwCadOpCdtQNuI1ywE1bkDyp7Bl1ucoB5W3N0JGYSK8g4v7Niei7+S053vx/gxgN/zx
         Y960BJgIprRQCKxctZ9WJGvYlcERuokU/0Yw6yXzRvbZ88pU/8Mv7p1KbwhpD+GiThsi
         CQew==
X-Gm-Message-State: AOAM5327fPCQ68CooJ62n63a2eXFtR4n/iqPpX46aedvr3XxQjw/AayO
        m5YLwVVWcCW9359JDeC+Zg==
X-Google-Smtp-Source: ABdhPJz1HOQEGn27fm10GoSHBJ6A+8pFDCLVgnpqkxvmdQgA1gDrUj7+WVId/5QTvBVq/Y/ZWpOIug==
X-Received: by 2002:a0c:f992:: with SMTP id t18mr5711445qvn.37.1637671456593;
        Tue, 23 Nov 2021 04:44:16 -0800 (PST)
Received: from serve.minyard.net ([47.184.156.158])
        by smtp.gmail.com with ESMTPSA id j21sm5963850qkk.27.2021.11.23.04.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 04:44:15 -0800 (PST)
Sender: Corey Minyard <tcminyard@gmail.com>
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:30e0:13f:84cd:1650])
        by serve.minyard.net (Postfix) with ESMTPSA id F36BE1800BA;
        Tue, 23 Nov 2021 12:44:14 +0000 (UTC)
Date:   Tue, 23 Nov 2021 06:44:13 -0600
From:   Corey Minyard <minyard@acm.org>
To:     Wolfram Sang <wsa@kernel.org>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andrew Manley <andrew.manley@sealingtech.com>
Subject: Re: [PATCH v2 2/2] i2c:imx: Add an extra read at the end of an I2C
 slave read
Message-ID: <20211123124413.GS15676@minyard.net>
Reply-To: minyard@acm.org
References: <20211112133956.655179-1-minyard@acm.org>
 <20211112133956.655179-3-minyard@acm.org>
 <YZzCWfvq5k2JaMka@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YZzCWfvq5k2JaMka@kunai>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Nov 23, 2021 at 11:28:41AM +0100, Wolfram Sang wrote:
> On Fri, Nov 12, 2021 at 07:39:56AM -0600, minyard@acm.org wrote:
> > From: Corey Minyard <minyard@acm.org>
> > 
> > The I2C slave interface expects that the driver will read ahead one
> > byte.  The IMX driver/device doesn't do this, but simulate it so that
> > read operations get their index set correctly.
> 
> From what I understand, the patch is correct but the description may be
> wrong?
> 
> AFAIU the patch adds the slave event I2C_SLAVE_READ_PROCESSED to the
> case when the last byte was transferred. We as the client got a NAK from
> the controller. However, the byte WAS processed, so the event is ok and
> not a dummy?
> 

I think the description is correct.  Devices that are read from (which
is just eeprom at the moment) expect that there is a dummy read at the
end of a read transaction.  Apparently this is what at least some slave
hardware does.  The I2C device being read doesn't know when the master
device will finish the operation.  So to be ready for the next read it
always reads ahead one.  When the read is terminated by the master,
there is an extra byte left lying around that is discarded.

The IMX driver doesn't work this way.  So when I was testing, I noticed
that if I did two reads in a row it was one byte off on the second read.

-corey
