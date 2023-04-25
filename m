Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A823F6EE46D
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Apr 2023 17:06:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234037AbjDYPGq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Apr 2023 11:06:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233875AbjDYPGp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Apr 2023 11:06:45 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B606A5265;
        Tue, 25 Apr 2023 08:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
        Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
        Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
        In-Reply-To:References; bh=NTydD/4nmJMk9g8LBuujDGSajQHQAPuZ1GWEmRpTPp0=; b=VJ
        G7bZhMV2slmfqhKXGrbz9rcAbY5oYr/3hNC02kVy82nE3DLy6yZc+RJr9j3yufOVH9U//7QiQusFG
        cRcrexdMlw9L/9VqkA8KYN1Mhppx3+npgLJx4JNRe5FdFOwN2dulUITdGPd00sKoLvpTOvPWtcgcy
        qVPjtH25VyVsrzY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1prKFZ-00BCJR-Ix; Tue, 25 Apr 2023 17:06:37 +0200
Date:   Tue, 25 Apr 2023 17:06:37 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     =?utf-8?B?5byg572R?= <m202171703@hust.edu.cn>
Cc:     Peter Korsgaard <peter@korsgaard.com>,
        hust-os-kernel-patches@googlegroups.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH v3] i2c: ocores: use devm_ managed clks
Message-ID: <b5c00122-0fe0-4020-9036-e4cc37d1b51a@lunn.ch>
References: <fc8ed989-68e6-4fd4-a818-ae077bf5e6aa@lunn.ch>
 <20230422123253.137368-1-silver_code@hust.edu.cn>
 <cf543f92-af0d-4862-bea6-53a358ee9a31@lunn.ch>
 <85952de.43bfe.187b8e24612.Coremail.m202171703@hust.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <85952de.43bfe.187b8e24612.Coremail.m202171703@hust.edu.cn>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Apr 25, 2023 at 10:47:29PM +0800, 张网 wrote:
> Hi Andrew,
> 
> I would like to express my sincere gratitude for taking the time and effort to review 
> my submitted patch. I understand that reviewing can be a time-consuming process 
> and I truly appreciate your dedication.
> 
> As we move forward, I would like to inquire about the first version[1] of the patch I submitted. 
> As clk_disable_unprepare() has checks for error pointer and NULL already, I think there is no 
> need to add the check. So both the first version of the patch and this one can work on this 
> branch.
> 
> If there are any further changes or revisions needed, please do not hesitate to let me know. 
> I am committed to learning and improving, and I welcome any feedback you may have. 
> Thank you again for your support and guidance throughout this process.
> 
> Best regards,
> Wang Zhang
> ---
> [1] http://patchwork.ozlabs.org/project/linux-i2c/patch/20230416071854.58335-1-silver_code@hust.edu.cn/

So this patch is about the IRQ being an error code, and doing the
correct cleanup.

With the change to devm_clk_get_ there is no need to disabled the
clock, it will be done automatically. This means there is no cleanup
the driver needs to do itself. So the patch is no longer needed.

    Andrew
