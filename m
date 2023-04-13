Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF4CD6E0D20
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Apr 2023 13:54:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230017AbjDMLyJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Apr 2023 07:54:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229742AbjDMLyI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 13 Apr 2023 07:54:08 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 654F286AD;
        Thu, 13 Apr 2023 04:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=KuiWSZ3342zAqQGbhgSFaorsuA9xgUbVSygSFrKlNE4=; b=FD3CkiwvA9LG35m6InUFSO6WBi
        ARu8HUkatt+GMlPtoV03+wL0P/kcPqh/vcdEWta57SaTN4JwkCXi73S3G0+kGx7XTjxYkqKwQjf2v
        OVoMtc2BjIK6HBFsIu4UFtOskX2LJQ4ufFZhXVXd+ZDoIMPgHk52oqwhNRai3AInaf6c=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1pmvWa-00ABJJ-4p; Thu, 13 Apr 2023 13:54:00 +0200
Date:   Thu, 13 Apr 2023 13:54:00 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc:     Peter Korsgaard <peter@korsgaard.com>,
        Federico Vaga <federico.vaga@cern.ch>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux@ew.tq-group.com,
        Gregor Herburger <gregor.herburger@tq-group.com>
Subject: Re: [PATCH v2] i2c: ocores: generate stop condition after timeout in
 polling mode
Message-ID: <f6a1ee9c-73bc-4e0c-b67e-6d8ade26e636@lunn.ch>
References: <20230413093737.15303-1-matthias.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230413093737.15303-1-matthias.schiffer@ew.tq-group.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Apr 13, 2023 at 11:37:37AM +0200, Matthias Schiffer wrote:
> From: Gregor Herburger <gregor.herburger@tq-group.com>
> 
> In polling mode, no stop condition is generated after a timeout. This
> causes SCL to remain low and thereby block the bus. If this happens
> during a transfer it can cause slaves to misinterpret the subsequent
> transfer and return wrong values.
> 
> To solve this, pass the ETIMEDOUT error up from ocores_process_polling()
> instead of setting STATE_ERROR directly. The caller is adjusted to call
> ocores_process_timeout() on error both in polling and in IRQ mode, which
> will set STATE_ERROR and generate a stop condition.
> 
> Fixes: 69c8c0c0efa8 ("i2c: ocores: add polling interface")
> Signed-off-by: Gregor Herburger <gregor.herburger@tq-group.com>
> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
