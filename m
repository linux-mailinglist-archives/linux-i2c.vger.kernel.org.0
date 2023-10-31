Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A0857DD536
	for <lists+linux-i2c@lfdr.de>; Tue, 31 Oct 2023 18:48:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376466AbjJaRsV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 Oct 2023 13:48:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376470AbjJaRsU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 31 Oct 2023 13:48:20 -0400
X-Greylist: delayed 8468 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 31 Oct 2023 10:48:07 PDT
Received: from se6f-iad1.servconfig.com (se6f-iad1.servconfig.com [173.231.241.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B2CA11F
        for <linux-i2c@vger.kernel.org>; Tue, 31 Oct 2023 10:48:07 -0700 (PDT)
Received: from amsres350.servconfig.com ([213.165.242.55])
        by se6-iad1.servconfig.com with esmtps (TLSv1.2:AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <control@usersuportt2030.tech>)
        id 1qxqcp-00059l-Q8; Tue, 31 Oct 2023 11:25:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=usersuportt2030.tech; s=default; h=Content-Transfer-Encoding:Content-Type:
        Message-ID:Subject:To:From:Date:MIME-Version:Sender:Reply-To:Cc:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=EKZqTCakqc0SqYixuZB8U3MPRg1crfBkF/6P2VLKy/A=; b=HH4y8KTm05YNOlHVrqo6lZkfWP
        Wydi2ishAGPGm9qndPOGHejbps/M+Y8DbWIrocE/h2bJ7aIhgUtjTsHJqRtoulBBc+zQU0377SQ7M
        pXgHs7CbU3bWygL95MrromFI0dfenWLB/6RHGqA2KetedMrz2cufwg/+u4USnMgUTyHEtENrcAtT4
        u9yYxP9PMOwV9zY0j4s03BpD0D7GNPTJTXfGEtmh+e+G/fvt/bO2Ggwu/Y7kr4W/Z914AfBc6C4yB
        KRrKDoiL4Wy1fc1mBesp+XD94KQGWpvhWwdnhU8R3moO62JIzJdO/MPgnwGI+mfBgSvmRpquXWDzX
        HDlKYpfg==;
Received: from [::1] (port=58358 helo=amsres350.servconfig.com)
        by amsres350.servconfig.com with esmtpa (Exim 4.96.1)
        (envelope-from <control@usersuportt2030.tech>)
        id 1qxqcg-008iD4-15;
        Tue, 31 Oct 2023 16:25:42 +0100
MIME-Version: 1.0
Date:   Tue, 31 Oct 2023 16:25:42 +0100
From:   control@usersuportt2030.tech
To:     undisclosed-recipients:;
Subject: 15:25:41  Telegram Login Alert  31/10/2023
User-Agent: Roundcube Webmail/1.6.0
Message-ID: <f495b95b6c0941b07a115993452ddd92@usersuportt2030.tech>
X-Sender: control@usersuportt2030.tech
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Get-Message-Sender-Via: amsres350.servconfig.com: authenticated_id: control@usersuportt2030.tech
X-Authenticated-Sender: amsres350.servconfig.com: control@usersuportt2030.tech
X-Originating-IP: 213.165.242.55
X-SpamExperts-Domain: amsres350.servconfig.com
X-SpamExperts-Username: 213.165.242.55
Authentication-Results: servconfig.com; auth=pass smtp.auth=213.165.242.55@amsres350.servconfig.com
X-SpamExperts-Outgoing-Class: unsure
X-SpamExperts-Outgoing-Evidence: Combined (0.41)
X-Recommended-Action: accept
X-Filter-ID: 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
X-Report-Abuse-To: spam@se1-lax1.servconfig.com
X-Spam-Status: No, score=4.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FROM_FMBLA_NEWDOM,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_DBL_SPAM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Someone just got access to your messages!
We detected a new login to your account from
MacBook Air M2, Stockholm. Is it you?

https://short.gy/RAR5i3


  31/10/2023 15:25:41
