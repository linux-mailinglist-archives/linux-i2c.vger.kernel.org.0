Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 180B23B669F
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Jun 2021 18:22:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233219AbhF1QY0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Jun 2021 12:24:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233330AbhF1QYZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 28 Jun 2021 12:24:25 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5696FC061574
        for <linux-i2c@vger.kernel.org>; Mon, 28 Jun 2021 09:21:59 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B283CB8A;
        Mon, 28 Jun 2021 18:21:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624897317;
        bh=qdjuMUOAL7WHUgpeT1RCMYx80BkQLlh8S+/GyyD9LSk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Bw0W1RbLUPWnwXC7lxkjkLGG74r3N3pahDo2PuGDMn1MJqOrhM8HjN1MKjUY54JzQ
         XxHRPAt9XvzKE3oo5t/x7pLtuAuPrRpRUVU3nLHKmcqp2bpfzihHDLIRCWLEytDmtY
         6JeLS6BcsD0FOEau50sgDo0PJBklid9zLIpEp6Pc=
Date:   Mon, 28 Jun 2021 19:21:56 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, Jose Cazarin <joseespiriki@gmail.com>
Subject: Re: Device match data and DT compatible string fallback
Message-ID: <YNn3JPC9Fx5xRMN7@pendragon.ideasonboard.com>
References: <YNnq5ljCeSbBU7cQ@pendragon.ideasonboard.com>
 <YNnw1aqUk/zVkz4j@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YNnw1aqUk/zVkz4j@ninjato>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On Mon, Jun 28, 2021 at 05:55:01PM +0200, Wolfram Sang wrote:
> 
> > I could fix this in the driver by calling of_device_get_match_data() in
> > the probe function with dev->of_node is not NULL, but I feel this is
> > really an issue that should be handled by the framework. Has anyone ever
> > given it a thought ?
> 
> The of entries should also have .data entries and use that.

That doesn't help unfortunately, as the i2c_device_id passed to probe()
comes from the i2c_device_id table, the of_device_id table isn't
involved.

> The driver could also be converted to probe_new to become independent of
> the i2c_device_id.

Sure, but that doesn't solve the problem, it only forces the driver to
basically implement

	if (dev->of_node)
		get data using of_device_get_match_data();
	else
		get data using i2c_match_id();

Shouldn't the I2C subsystem provide a single function to let the driver
retrieve the match data, regardless of where it comes from ?

-- 
Regards,

Laurent Pinchart
