Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA04B7DD462
	for <lists+linux-i2c@lfdr.de>; Tue, 31 Oct 2023 18:12:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344256AbjJaRMH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 Oct 2023 13:12:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344282AbjJaRMG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 31 Oct 2023 13:12:06 -0400
X-Greylist: delayed 9989 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 31 Oct 2023 10:12:01 PDT
Received: from se2h-iad1.servconfig.com (se2h-iad1.servconfig.com [173.231.248.14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 215409F
        for <linux-i2c@vger.kernel.org>; Tue, 31 Oct 2023 10:12:00 -0700 (PDT)
Received: from amsres350.servconfig.com ([213.165.242.55])
        by se2-iad1.servconfig.com with esmtps (TLSv1.2:AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <control@usersuportt1009.tech>)
        id 1qxmYj-0003iB-HX; Tue, 31 Oct 2023 07:05:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=usersuportt1009.tech; s=default; h=Content-Transfer-Encoding:Content-Type:
        Message-ID:Subject:To:From:Date:MIME-Version:Sender:Reply-To:Cc:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=K3AOmgyfF6hlcf+JkguTT+yTGUI8bKKsdalLQ6ODR1s=; b=DSTp8Q6HheLv5zWdjOvIeYKtIl
        QwLeoajBs+dXcPZpz/4RXhIkkEXIcmQDVbVCRgr0/b4cRtnNzh9hCTNpPtQJOIgATvl7Rgm45CD0q
        DkuPsOc299ipMV4jy9M4uioKpQJs7EQ5lpeRa+GEfHKbvnOtJoHVsPKjT7IzffYiL9ixSCexg5uQ4
        iFtEo6PSMdHR+DWy7iUARMuLprZX2Zz9jBQDqCSu7VgJIZJWufAwW1TK8OKAmob+08wX8gG9lhvkm
        +LIi+7hiNgUQjNhkpyPVbL2ieMglurlE+5ZHPjDZzZyDLivwY0GcDTlnoVJUvZKkIJmLivdL+PJix
        JuCM+7oA==;
Received: from [::1] (port=54450 helo=amsres350.servconfig.com)
        by amsres350.servconfig.com with esmtpa (Exim 4.96.1)
        (envelope-from <control@usersuportt1009.tech>)
        id 1qxmYa-004ncv-1R;
        Tue, 31 Oct 2023 12:05:12 +0100
MIME-Version: 1.0
Date:   Tue, 31 Oct 2023 12:05:12 +0100
From:   control@usersuportt1009.tech
To:     undisclosed-recipients:;
Subject: 11:05:11  Telegram Login Alert  31/10/2023
User-Agent: Roundcube Webmail/1.6.0
Message-ID: <1b0cab5da2aded02e03ccd705d51bff7@usersuportt1009.tech>
X-Sender: control@usersuportt1009.tech
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Get-Message-Sender-Via: amsres350.servconfig.com: authenticated_id: control@usersuportt1009.tech
X-Authenticated-Sender: amsres350.servconfig.com: control@usersuportt1009.tech
X-Originating-IP: 213.165.242.55
X-SpamExperts-Domain: amsres350.servconfig.com
X-SpamExperts-Username: 213.165.242.55
Authentication-Results: servconfig.com; auth=pass smtp.auth=213.165.242.55@amsres350.servconfig.com
X-SpamExperts-Outgoing-Class: unsure
X-SpamExperts-Outgoing-Evidence: Combined (0.39)
X-Recommended-Action: accept
X-Filter-ID: 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
X-Report-Abuse-To: spam@se1-lax1.servconfig.com
X-Spam-Status: No, score=2.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FROM_FMBLA_NEWDOM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Someone just got access to your messages!
We detected a new login to your account from
MacBook Air M2, Stockholm. Is it you?

https://short.gy/rwLmdq


  31/10/2023 11:05:11
