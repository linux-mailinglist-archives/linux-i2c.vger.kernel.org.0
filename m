Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F952659EE7
	for <lists+linux-i2c@lfdr.de>; Sat, 31 Dec 2022 00:54:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235661AbiL3Xyd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 30 Dec 2022 18:54:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235810AbiL3Xyb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 30 Dec 2022 18:54:31 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA0FB1DF3A;
        Fri, 30 Dec 2022 15:54:30 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5D20CB81DD1;
        Fri, 30 Dec 2022 23:54:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2B42C433EF;
        Fri, 30 Dec 2022 23:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672444468;
        bh=AAPK9XSQHHgh0qvLsmwiNWwN3eQnjJuKKP4MZDTbj6g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UuxdVp1TFYOFWUP4ThNtYfaaIBiK0coESQmd9YRUqc4iWtVRe6M+D0vkJdtQrf8lG
         WKpJQ8w8cWBeTPwCAkEt8zCGDwamexfXUQQ0QssNmz+DbY9iVauvmx0Bs72m1V2vBG
         1pVxRDqjQ4YsxIHA+U+tX+gB1qIm32P92zb3E2P1ZWVAMftSBeUkt2jxaXGOe6KMYq
         TO2an/gvcHSYNISexDi3mTWd+S/UJ7zfaFk489f6XLep4dS48n/K4EBs+Ow+xZBVXh
         bmyetuH2SCiI/GJJcRPt54/GIpxmlkthjbk7np/FRlrjp1W90VTfyxX37h5Cl30/FD
         OhzGvrzYqoYhQ==
Date:   Fri, 30 Dec 2022 23:54:25 +0000
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>,
        Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>, Peter Huewe <peterhuewe@gmx.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        linux-integrity@vger.kernel.org
Subject: Re: [PATCH 001/606] tpm: st33zp24: Convert to Convert to i2c's
 .probe_new()
Message-ID: <Y696MSvhEUWlHSoK@kernel.org>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-2-uwe@kleine-koenig.org>
 <20221216090904.qlekgvtpriijmvay@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221216090904.qlekgvtpriijmvay@pengutronix.de>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

I picked it now.

BR, Jarkko

On Fri, Dec 16, 2022 at 10:09:04AM +0100, Uwe Kleine-König wrote:
> Hello,
> 
> while rebasing my series onto today's next I noticed the Subject being
> broken:
> 
> 	$Subject ~= s/Convert to //
> 
> Apart from that I wonder who feels responsible to apply this patch (and
> the other tpm patches in this series). They got an Ack by Jarkko, but
> didn't appear in next.
> 
> The plan for this series is not to apply to a single tree, but let the
> subsystem maintainers take their patches. I'd be happy if you consider
> them for the next merge window.
> 
> Should I resend the tpm patches (with the subject fixed) once v6.2-rc1
> is published?
> 
> Note that 662233731d66 ("i2c: core: Introduce i2c_client_get_device_id
> helper function") is already in Linus' tree, so if your tree is new
> enough (say v6.2-rc1 then) you don't need to care for this dependency.
> 
> Best regards and thanks
> Uwe
> 
> -- 
> Pengutronix e.K.                           | Uwe Kleine-König            |
> Industrial Linux Solutions                 | https://www.pengutronix.de/ |


