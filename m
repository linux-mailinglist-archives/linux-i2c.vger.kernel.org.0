Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BDCEC144B
	for <lists+linux-i2c@lfdr.de>; Sun, 29 Sep 2019 13:07:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727411AbfI2LHX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 29 Sep 2019 07:07:23 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:60859 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725924AbfI2LHX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 29 Sep 2019 07:07:23 -0400
X-Originating-IP: 93.158.25.216
Received: from nexussix (93-158-25-216.subs.ibrowse.com [93.158.25.216])
        (Authenticated sender: cengiz@kernel.wtf)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 57ED5240004;
        Sun, 29 Sep 2019 11:07:19 +0000 (UTC)
Message-ID: <2a3f9ec1955e8b785888994e2a9b7cc0d5800a71.camel@kernel.wtf>
Subject: Re: [PATCH] i2c: pca954x: Add property to skip disabling PCA954x
 MUX device
From:   Cengiz Can <cengiz@kernel.wtf>
Reply-To: cengiz@kernel.wtf
To:     Biwen Li <biwen.li@nxp.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        peda@axentia.se, leoyang.li@nxp.com,
        Wolfram Sang <wsa@the-dreams.de>
Date:   Sun, 29 Sep 2019 14:07:19 +0300
In-Reply-To: <20190929103638.46038-1-biwen.li@nxp.com>
References: <20190929103638.46038-1-biwen.li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.0 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello Biwen,

> +       /* Errata ID E-00013 on board LS2088ARDB and LS2088ARDB:
> +        * The point here is that you must not disable a mux if there
> +        * are no pullups on the input or you mess up the I2C. This
> +        * needs to be put into the DTS really as the kernel cannot
> +        * know this otherwise.
> +        */

Can you please explain what a "mess up" is?

And also, should we put this new DTS property in related default
bindings? 

If not, are you planning a documentation update for the users to notify
them about this?

-- 
Cengiz Can <cengiz@kernel.wtf>

