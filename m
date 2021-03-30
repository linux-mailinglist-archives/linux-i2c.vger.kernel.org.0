Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9C8034E9D8
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Mar 2021 16:06:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231979AbhC3OFp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Mar 2021 10:05:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231933AbhC3OF0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 Mar 2021 10:05:26 -0400
X-Greylist: delayed 377 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 30 Mar 2021 07:05:24 PDT
Received: from mail.enpas.org (zhong.enpas.org [IPv6:2a03:4000:2:537::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 45E1CC061574;
        Tue, 30 Mar 2021 07:05:23 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        by mail.enpas.org (Postfix) with ESMTPSA id 9748DFF93C;
        Tue, 30 Mar 2021 13:59:04 +0000 (UTC)
Date:   Tue, 30 Mar 2021 15:58:56 +0200
From:   Max Staudt <max@enpas.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/12] i2c: icy: Constify the software node
Message-ID: <20210330155856.3cf32fce.max@enpas.org>
In-Reply-To: <20210329105047.51033-10-heikki.krogerus@linux.intel.com>
References: <20210329105047.51033-1-heikki.krogerus@linux.intel.com>
        <20210329105047.51033-10-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This looks great, thank you for constifying this.

Finally it's clean again, yet much more flexible than the original
platform_data approach when I first submitted the driver.



Thanks everyone for your work

Max
