Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47A053715A8
	for <lists+linux-i2c@lfdr.de>; Mon,  3 May 2021 15:05:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234034AbhECNGq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 May 2021 09:06:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233361AbhECNGp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 May 2021 09:06:45 -0400
Received: from mail.enpas.org (zhong.enpas.org [IPv6:2a03:4000:2:537::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B0AEFC06174A;
        Mon,  3 May 2021 06:05:52 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        by mail.enpas.org (Postfix) with ESMTPSA id 23EC9FF9D7;
        Mon,  3 May 2021 13:05:49 +0000 (UTC)
Date:   Mon, 3 May 2021 15:05:46 +0200
From:   Max Staudt <max@enpas.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: icy: Remove unused variable new_fwnode in
 icy_probe()
Message-ID: <20210503150546.5a5e12c1.max@enpas.org>
In-Reply-To: <20210503070220.23932-1-geert@linux-m68k.org>
References: <20210503070220.23932-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Thanks for catching this warning :)


Reviewed-by: Max Staudt <max@enpas.org>
