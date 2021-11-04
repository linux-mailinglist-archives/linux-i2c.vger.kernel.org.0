Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31112444E93
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Nov 2021 07:00:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229994AbhKDGDH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 4 Nov 2021 02:03:07 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:38207 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229968AbhKDGDG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 4 Nov 2021 02:03:06 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 5F0ED5808FF;
        Thu,  4 Nov 2021 02:00:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Thu, 04 Nov 2021 02:00:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.in; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm1; bh=XG5SjLSIYpcUNInidXITrQIdb+
        0tTZMc/XqazBhh2TI=; b=GQqxouLO9RdkOFxM5pkM5MYr4NEtu8TsKRpcaEsjr3
        exBFo4BsXHr2ikzrc3mEFj783QWL1ITPWW8gaq+mr7YAQWdhb2zqmJO28JSsp40u
        NzTTZaZKzhnO14tWd2nzHCxX2vcLXf4iEAp8IarU6beVOsuqWk63JuT5Q8jMFWdP
        HXbaIOg6rNoXcPJPDoYqKp0Tv/L0ZeafaaiBat0Bas9MKrcle5GmHGMKW5zhJh5W
        /Iu7kUC7loGCbLKbeOhO62KKzMY0Vffg2/6d2vTyxRlyi3XJ8YdBvghP2u3/cZUz
        qX2VwOfCHFH28iG+24BkcA0dW3RCJerlzrClUnr8Wc2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=XG5SjLSIYpcUNInid
        XITrQIdb+0tTZMc/XqazBhh2TI=; b=fpOFOKoJbDNap8cIPTBMBTmXOWLbJBH9e
        vGVfN7nJGwDstmuy/18kupQkVvm9JJGHS4heuOHu3aFFhqGsjc/yPvmdDLpKVjql
        +zTY2EkgGFUN5H2eOh2FRwys3cNuJAixcBCz7Vn/zoenUO2lZqCgGtO0i2cmYNLP
        RcmWGnhYLPWCl8VURh6ICRBpKIH9aFCtQnxTwKC+xSnhaKh0YL8jb8ZMarICvJV7
        VXp5dy8NdhDXA+Ph+pRZBTpvUoa4Fdg3sbG7lR1F19KciapN80noJ5gx0V8ioaPz
        1VAcgpdvZ1KHWDlY3+99QjUmZ6x0ef6AluHwokAKvbNlVAYX5obsg==
X-ME-Sender: <xms:-3aDYeZaQD0ljUtINysoDfLNEToMz83l-vvBwFDQUQVl3LVQtnHa1g>
    <xme:-3aDYRZ0D25LN1SPtNUNrKSPIc12NyHFCKGLFI4b4xOxS47v-cYALVn2h3LqhZ-q6
    V_fh-FhkQ8Y5p4f4YI>
X-ME-Received: <xmr:-3aDYY-JiM5VTabAV4Us7GSgJfKD8ZIscmBwp8ZGhSieWrojP3e78vZT>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrtdefgdekiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
    dtnecuhfhrohhmpeffvggvphcuofgrjhhumhguvghruceouggvvghpsehfrghsthhmrghi
    lhdrihhnqeenucggtffrrghtthgvrhhnpedvvedtkefhteeggfehveehgeehgeeigfekke
    fgteejleehffffffeggfdtheetleenucffohhmrghinhepnhigphdrtghomhdpphholhho
    lhhurdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepuggvvghpsehfrghsthhmrghilhdrihhn
X-ME-Proxy: <xmx:-3aDYQp4cLKVLfZAYE49MESybtFuc1TCXT01O8WARJRsFJKkHFbwoA>
    <xmx:-3aDYZrcN5ecFDUoekmZVYxpB15yo1D4zqXANv5GX1_k_yHUO8YXyQ>
    <xmx:-3aDYeTl2f2B7oBbeXeaM9kRja2FM9fq8apAjMTEnSxWsja_QdEiag>
    <xmx:_HaDYQWke8rLsCaeq5xqmY_fHqrbTNYKyxASgkoD-ygDMpGcUdpi8w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 Nov 2021 02:00:26 -0400 (EDT)
From:   Deep Majumder <deep@fastmail.in>
To:     wsa@kernel.org
Cc:     linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Deep Majumder <deep@fastmail.in>
Subject: [PATCH] Docs: Fixes link to I2C specification
Date:   Thu,  4 Nov 2021 11:30:18 +0530
Message-Id: <20211104060018.35570-1-deep@fastmail.in>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The link to the I2C specification is broken and is replaced in this
patch by one that points to Rev 6 (2014) of the specification.
Although `https://www.nxp.com" hosts the Rev 7 (2021) of this
specification, it is behind a login-wall and thus cannot be used.

Signed-off-by: Deep Majumder <deep@fastmail.in>
---
 Documentation/i2c/summary.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/i2c/summary.rst b/Documentation/i2c/summary.rst
index 136c4e333be7..607c72425ca6 100644
--- a/Documentation/i2c/summary.rst
+++ b/Documentation/i2c/summary.rst
@@ -12,7 +12,7 @@ and so are not advertised as being I2C but come under different names,
 e.g. TWI (Two Wire Interface), IIC.
 
 The official I2C specification is the `"I2C-bus specification and user
-manual" (UM10204) <https://www.nxp.com/docs/en/user-guide/UM10204.pdf>`_
+manual" (UM10204) <https://www.pololu.com/file/0J435/UM10204.pdf>`_
 published by NXP Semiconductors.
 
 SMBus (System Management Bus) is based on the I2C protocol, and is mostly
-- 
2.30.2

