Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF42172ABE7
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Jun 2023 15:54:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230263AbjFJNyZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 10 Jun 2023 09:54:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229749AbjFJNyY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 10 Jun 2023 09:54:24 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA81CE57;
        Sat, 10 Jun 2023 06:54:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 661CE6119D;
        Sat, 10 Jun 2023 13:54:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 541DBC433D2;
        Sat, 10 Jun 2023 13:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686405262;
        bh=G4QwqKarePCCSH6s+XR3oDrzHCOvVUyer99pWwJDgVM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KTuEsvUxWEPhVaLkMsOVctzQ3wImqrKHrA+x3jspcPwKgZwpmAopn0F1xfzcQhJ3h
         zar/sZ6Z+UPCLRDNzEODraEz/AVHRbRTCaYQHpLAoaSbCr47KFFMUK1rm3+FHjemxL
         jyJvUaXpua6YA9TReA0Qnbs5ukqOAW1SmpWLKmVSWmGFBBeyRElowzpHnqD1pcv8CO
         oR6a6+49wLhhLfxqDugAg8RXf1uh2VzA6BU2o8jY6qROsDGFzCACbwXhNPB+qTDFT4
         u8jNI2J0mCqYm0YtETe7wjrP6K7n03ITvdz7/C68+HV/pbUH+NHkqfUQlWoAFwIK5u
         4E5OKmKc8CtLA==
Date:   Sat, 10 Jun 2023 15:54:19 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Tao Lan <taolan@huawei.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c-hix5hd2:  Add I2C_M_STOP flag support for
 i2c-hix5hd2 driver.
Message-ID: <20230610135419.rh4xuldy6oykdhog@intel.intel>
References: <20220930014507.5612-1-taolan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220930014507.5612-1-taolan@huawei.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Taolan,

On Fri, Sep 30, 2022 at 01:45:07AM +0000, Tao Lan wrote:
> From: taolan <taolan@huawei.com>
> 
> For compatibility, some devices need to work with controller between
> messages using a stop.
> 
> Signed-off-by: taolan <taolan@huawei.com>

Acked-by: Andi Shyti <andi.shyti@kernel.org> 

Thanks,
Andi
