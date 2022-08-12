Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D1B4590C52
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Aug 2022 09:13:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237045AbiHLHNW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 12 Aug 2022 03:13:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233593AbiHLHNV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 12 Aug 2022 03:13:21 -0400
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [IPv6:2001:4b98:dc4:8::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F9562B26A;
        Fri, 12 Aug 2022 00:13:20 -0700 (PDT)
Received: from booty (unknown [37.160.128.155])
        (Authenticated sender: luca.ceresoli@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 87BF620000C;
        Fri, 12 Aug 2022 07:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1660288398;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IF44qkqwISS+cbqH8Zu5IxJgzrG6pqiUPQgrbZxxoqM=;
        b=FGFazt4YnYKQGcLph0AXHdT7t9K+o8QdwwKKIDhxNlzW26TwzmqVwkozivpMGlMxe7GAnW
        EsGvghVcbVf18pxqyQ87vOTPaWOchnI/TiQZ9++WgeC3I35OuJ2KfONMWweYdObdOpZhXH
        onMMUzYISuRfnh1+9DjkerLewfGX/kNkwpH4Q+UwSUmshdgwSNuBWJzRM4rrDB2pjJ+k+N
        wESmfc+p4UXvFPg4L+XTkZLQtpFZUI0E6L0Fb3ezOJLtYDUncjJ7kBvOzAtps8dMhOvCs8
        s0EjQwDdqrCaFar5UmAlaRXQb2b5C/sJwEGtzZ0jc50baTIjvHZ0aL7xoRBC4g==
Date:   Fri, 12 Aug 2022 09:13:15 +0200
From:   Luca Ceresoli <luca.ceresoli@bootlin.com>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 8/9] docs: i2c: i2c-sysfs: improve wording
Message-ID: <20220812091315.2838b273@booty>
In-Reply-To: <YvVzQMvjb89kiNLZ@shikoro>
References: <20220808141708.1021103-1-luca.ceresoli@bootlin.com>
        <20220808141708.1021103-9-luca.ceresoli@bootlin.com>
        <YvVxE9jLNJZ0NWtd@shikoro>
        <YvVzQMvjb89kiNLZ@shikoro>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On Thu, 11 Aug 2022 23:23:12 +0200
Wolfram Sang <wsa@kernel.org> wrote:

> > Does 'confusion' have a plural? I think singular is better here.  
> 
> I took the liberty to fix it myself so we can have the patch in rc1
> already. I hope this is fine with you.

Sure, thank you!

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
