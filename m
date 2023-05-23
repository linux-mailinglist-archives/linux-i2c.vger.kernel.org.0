Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6416E70DC0A
	for <lists+linux-i2c@lfdr.de>; Tue, 23 May 2023 14:10:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236661AbjEWMKv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 May 2023 08:10:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231621AbjEWMKu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 23 May 2023 08:10:50 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59D1111A;
        Tue, 23 May 2023 05:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=axlCGPqa+QD9bXHQ+8rchdfcg+msG+OHVPT/ggPIoMY=; b=Wtv3c/k/hJ2GtAQOKir/TwZNMc
        sekfS7FHJYW2qszKuZPxRNwh07FROVXCxlQNP6efZnaqhtDL3Jk24PQYSFzqcW+OQW3AVZzUd+T4x
        uZPpjmOjjhuxR0i05KN0q9rWg7wFconQdOWukvWzGsmvPrEXBvHuPWWszqRe4gO6NWgc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1q1QqY-00DgQL-Gz; Tue, 23 May 2023 14:10:34 +0200
Date:   Tue, 23 May 2023 14:10:34 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     =?utf-8?B?5byg572R?= <m202171703@hust.edu.cn>
Cc:     hust-os-kernel-patches@googlegroups.com,
        peter korsgaard <peter@korsgaard.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH v3] i2c: ocores: use devm_ managed clks
Message-ID: <c5c8d9f7-ed50-4650-a5ac-b481999212cf@lunn.ch>
References: <fc8ed989-68e6-4fd4-a818-ae077bf5e6aa@lunn.ch>
 <20230422123253.137368-1-silver_code@hust.edu.cn>
 <cf543f92-af0d-4862-bea6-53a358ee9a31@lunn.ch>
 <5572a733.abc0.18846f13b0b.Coremail.m202171703@hust.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5572a733.abc0.18846f13b0b.Coremail.m202171703@hust.edu.cn>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> Hi Andrew,
> I'm checking in about my patch submission for i2c ocores that was
> "review'ed" on 4/25, but its status has not been updated yet.
> I would greatly appreciate it if you could provide me with an 
> update on the status of my submission. Is there any additional 
> information or documentation that I can provide to help expedite 
> the process?

I think your patch was submitted during the merge window. This is the
point in time when subsystems give Linus patches for the next
release. During those two weeks new patches are not accepted.

https://www.kernel.org/doc/html/latest/process/2.Process.html

Now that the merge window is closed, please rebase your patch on

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next

and resubmit. Include my Reviewed-by tag.

	Andrew
