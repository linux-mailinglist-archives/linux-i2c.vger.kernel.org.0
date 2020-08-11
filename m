Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAE7B241EA6
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Aug 2020 18:50:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728978AbgHKQt7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 Aug 2020 12:49:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728962AbgHKQt7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 11 Aug 2020 12:49:59 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E60FC06174A;
        Tue, 11 Aug 2020 09:49:59 -0700 (PDT)
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id C5D714FA;
        Tue, 11 Aug 2020 16:49:58 +0000 (UTC)
Date:   Tue, 11 Aug 2020 10:49:57 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Stephen Kitt <steve@sk2.org>
Cc:     linux-doc@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: remove the 2.6 "Upgrading I2C Drivers" guide
Message-ID: <20200811104957.1e357e8c@lwn.net>
In-Reply-To: <20200806161456.8680-1-steve@sk2.org>
References: <20200806161456.8680-1-steve@sk2.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu,  6 Aug 2020 18:14:56 +0200
Stephen Kitt <steve@sk2.org> wrote:

> All the drivers have long since been upgraded, and all the important
> information here is also included in the "Implementing I2C device
> drivers" guide.
> 
> Signed-off-by: Stephen Kitt <steve@sk2.org>
> ---
>  Documentation/i2c/index.rst             |   1 -
>  Documentation/i2c/upgrading-clients.rst | 285 ------------------------
>  2 files changed, 286 deletions(-)
>  delete mode 100644 Documentation/i2c/upgrading-clients.rst

Applied, thanks.

jon
