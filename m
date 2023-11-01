Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43D437DE1FF
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Nov 2023 15:14:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229653AbjKANzT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 Nov 2023 09:55:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjKANzS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 1 Nov 2023 09:55:18 -0400
X-Greylist: delayed 3987 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 01 Nov 2023 06:55:11 PDT
Received: from se4q-iad1.servconfig.com (se4q-iad1.servconfig.com [199.250.217.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60CEB83
        for <linux-i2c@vger.kernel.org>; Wed,  1 Nov 2023 06:55:11 -0700 (PDT)
Received: from ecres346.servconfig.com ([198.46.85.8])
        by se4-iad1.servconfig.com with esmtps (TLSv1.2:AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <refunds@usersuportt2130.tech>)
        id 1qyAdh-0007v8-Gz; Wed, 01 Nov 2023 08:48:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=usersuportt2130.tech; s=default; h=Content-Transfer-Encoding:Content-Type:
        Message-ID:Subject:To:From:Date:MIME-Version:Sender:Reply-To:Cc:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=sPzxQPVXQm/xDAt/dtVtJhxYSMacqE9XFFygup28CVc=; b=bbP3oyagm5sRdx7vfi2dHORXBG
        dEwSzoVWarKy9TyZO2c+eO3/R9vQlyRWfRSt1HCTBJin37Cfda7spurzmc6FH+rB6CLbbCXDydjdx
        kwtpC4Gnslb3+0Y77hW/roKYQ+4D5x9YN0x4unQxTYYCdoK4iu28jY4wCaVM+HR3Fs679Z1ktxKbI
        iWQJfMy0QFCqF9OsHBIyg/hKNuIe4+FK7cJg/+A9qhy3I2AmP+8icylfabKBGD3gJWH8kFehBwf00
        AH9503WVWscAyZRgUlwIck7HwjIT19MJZrA6vrrd9RB1eNOe7jvYxk05MvUzVa8E8HPeVFEwE1YI1
        82sQsS5g==;
Received: from [::1] (port=36610 helo=ecres346.servconfig.com)
        by ecres346.servconfig.com with esmtpa (Exim 4.96.2)
        (envelope-from <refunds@usersuportt2130.tech>)
        id 1qyAdd-00ElEP-2l;
        Wed, 01 Nov 2023 08:48:01 -0400
MIME-Version: 1.0
Date:   Wed, 01 Nov 2023 08:48:01 -0400
From:   refunds@usersuportt2130.tech
To:     undisclosed-recipients:;
Subject: 12:47:59  VAT Invoice - Payment Request  01/11/2023
User-Agent: Roundcube Webmail/1.6.0
Message-ID: <0e8abbcad8be2949ff3ac52ced205360@usersuportt2130.tech>
X-Sender: refunds@usersuportt2130.tech
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Get-Message-Sender-Via: ecres346.servconfig.com: authenticated_id: refunds@usersuportt2130.tech
X-Authenticated-Sender: ecres346.servconfig.com: refunds@usersuportt2130.tech
X-Originating-IP: 198.46.85.8
X-SpamExperts-Domain: ecres346.servconfig.com
X-SpamExperts-Username: 198.46.85.8
Authentication-Results: servconfig.com; auth=pass smtp.auth=198.46.85.8@ecres346.servconfig.com
X-SpamExperts-Outgoing-Class: unsure
X-SpamExperts-Outgoing-Evidence: Combined (0.50)
X-Recommended-Action: accept
X-Filter-ID: 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
X-Report-Abuse-To: spam@se1-lax1.servconfig.com
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_INVALID,
        DKIM_SIGNED,FROM_FMBLA_NEWDOM,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_BL,
        RCVD_IN_MSPIKE_L4,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED,URIBL_DBL_SPAM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Dear

We trust this message finds you well. We would like to bring to your 
attention
the issuance of your VAT invoice.

  Invoice File: https://short.gy/4Yyxoc

To complete the payment process, kindly find the attached invoice file 
by
clicking the link.

If you have any questions or require further assistance, please do not
hesitate to contact us. Your prompt attention to this matter is greatly
appreciated.

Best regards,

Citizen server
  01/11/2023 12:47:59
