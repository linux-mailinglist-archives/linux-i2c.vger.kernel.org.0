Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFCF4631CE2
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Nov 2022 10:33:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230252AbiKUJdT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Nov 2022 04:33:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230236AbiKUJdR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Nov 2022 04:33:17 -0500
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A71C913FA0;
        Mon, 21 Nov 2022 01:33:14 -0800 (PST)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AL6EGQB024298;
        Mon, 21 Nov 2022 03:32:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=PODMain02222019;
 bh=aC0T7Vu4Q1kc1WkUgkaUMyxtsl8A2C/KujD/uy/JZBA=;
 b=IRtUsnGFgJE2L9nfRpMCBJYBjrB0S4KltoP3d6+5fD5ZxWzwQ/Swqxh/GxADWUrsTKYd
 +If44Nn6kb41hMilIz62x1AQK8LrFw4887WRvqd8urLme2aFcX4GyYNTYJaYfCnT3oKE
 C/jPxKKSbJXZJq5/2jSHUoAcjr/Yz7WYoMmBIIvbOhukRAVY7iAxQp0sK92j5z9UL7hF
 EtV64zLEe4KH6cJKOdWymxKBhGlKkFOIC/zq8c+BfkT5JdbLfMwZLbQBbosF3J+weruB
 sufKWzDxi00oOuS8vpkXLDgstQc7DGuEnHg1zwkm/o/tMGhu3w+1nX25RvBhLETe6/S9 Pw== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
        by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3kxwe6sxy1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 21 Nov 2022 03:32:54 -0600
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Mon, 21 Nov
 2022 03:32:53 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.20 via Frontend Transport; Mon, 21 Nov 2022 03:32:52 -0600
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id DAB7E468;
        Mon, 21 Nov 2022 09:32:52 +0000 (UTC)
Date:   Mon, 21 Nov 2022 09:32:52 +0000
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
CC:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>, Lee Jones <lee@kernel.org>,
        <linux-i2c@vger.kernel.org>, <kernel@pengutronix.de>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, <patches@opensource.cirrus.com>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 418/606] mfd: arizona-i2c: Convert to i2c's .probe_new()
Message-ID: <20221121093252.GO10437@ediswmail.ad.cirrus.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-419-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-419-uwe@kleine-koenig.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: 5IVW23JrfabCgE7Hhswp9oVIPgkEyPHe
X-Proofpoint-GUID: 5IVW23JrfabCgE7Hhswp9oVIPgkEyPHe
X-Proofpoint-Spam-Reason: safe
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Nov 18, 2022 at 11:42:32PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> .probe_new() doesn't get the i2c_device_id * parameter, so determine
> that explicitly in the probe function.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
