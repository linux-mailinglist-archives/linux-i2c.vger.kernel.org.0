Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFDF87D5CEA
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Oct 2023 23:11:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344155AbjJXVLB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Oct 2023 17:11:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232399AbjJXVK7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 Oct 2023 17:10:59 -0400
X-Greylist: delayed 5367 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 24 Oct 2023 14:10:56 PDT
Received: from se1i-lax1.servconfig.com (se1i-lax1.servconfig.com [173.231.224.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C9A610CF;
        Tue, 24 Oct 2023 14:10:56 -0700 (PDT)
Received: from res345.servconfig.com ([192.145.232.116])
        by se1-lax1.servconfig.com with esmtps (TLSv1.2:AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <security1@usersuportt2307.tech>)
        id 1qvNGF-0002oA-J7; Tue, 24 Oct 2023 15:40:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=usersuportt2307.tech; s=default; h=Content-Transfer-Encoding:Content-Type:
        Message-ID:Subject:To:From:Date:MIME-Version:Sender:Reply-To:Cc:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=+BEqPn4LiF/VIj56I8Kk8asVbvcLjvRFPTpKmB2EgsY=; b=PgxO1XdNXxg/ZtmNRpmXPqNhRG
        Za1vb8I0c/H8+Ka61saYTXOfHMXF4+77hL94uZoJWWyZ19UuoJqJgkqFSU24fSMiT5d6r/EE/E1wy
        6Bsjr75Mu+wAWS/d/laCYGZqJ6B1eCK5yRn9SLaayvSvcpbd1idgWDc0vf44Wb+w3Ws255TaJJcpN
        9NAa5dLj2nwbf6O88O3bVfYe3Msnq9pC2RISW+p0T6090mjcjyzhjWvMlpnVQBflIrQJpl86KekFr
        R/12fSbhOknbYl/0P10fQ+depRqClPdMLJebcB5mvqijmjNz7PdL1V3KWC6X44dxXqLDpi/5XhJeD
        M9vXUb5g==;
Received: from [::1] (port=37724 helo=res345.servconfig.com)
        by res345.servconfig.com with esmtpa (Exim 4.96.2)
        (envelope-from <security1@usersuportt2307.tech>)
        id 1qvNG1-00848o-28;
        Tue, 24 Oct 2023 12:40:05 -0700
MIME-Version: 1.0
Date:   Tue, 24 Oct 2023 12:40:05 -0700
From:   security1@usersuportt2307.tech
To:     undisclosed-recipients:;
Subject: 7:40:03 PM  Telegram Login Alert  10/24/2023
User-Agent: Roundcube Webmail/1.6.0
Message-ID: <498d99a713532bbc48d5915a976756ec@usersuportt2307.tech>
X-Sender: security1@usersuportt2307.tech
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Get-Message-Sender-Via: res345.servconfig.com: authenticated_id: security1@usersuportt2307.tech
X-Authenticated-Sender: res345.servconfig.com: security1@usersuportt2307.tech
X-Originating-IP: 192.145.232.116
X-SpamExperts-Domain: res345.servconfig.com
X-SpamExperts-Username: 192.145.232.116
Authentication-Results: servconfig.com; auth=pass smtp.auth=192.145.232.116@res345.servconfig.com
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.29)
X-Recommended-Action: accept
X-Filter-ID: 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
X-Report-Abuse-To: spam@se1-lax1.servconfig.com
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Someone just got access to your messages!
We detected a new login to your account from
MacBook Air M2, Stockholm. Is it you?

https://short.gy/JR9hpn

LAT: 59.334591, LONG: 18.063240
  10/24/2023 7:40:03 PM
