Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C516312AA5
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Feb 2021 07:20:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229636AbhBHGUL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Feb 2021 01:20:11 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:44845 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229621AbhBHGUK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Feb 2021 01:20:10 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 261AA5C0064;
        Mon,  8 Feb 2021 01:19:24 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Mon, 08 Feb 2021 01:19:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm1; bh=/JE/fdBn0uHAF/reuWXJArsbux
        bUtZ2QdHblap0c0Ec=; b=MuYpXP++C1N95kubW3DHmA9cUIqD1tvdpQZ/Uxf7o0
        nDz3dX4yi3i2Tx2XE4DpX7+lhNqvGHbmwgZ44pYWC9dbTOhD12YmDTDVDaMTTGhq
        Na3kRUi2vaByLLSfQDnS3sn/3cW6lkP/B6swkczWtDuHe5JsGkhR58i2BRwbBFT1
        bch99ZLiVCPym6IR7LEXxneQeEAE2ahDFav8mG8PATH52TjfjvLiDeTqGcLAVB34
        TgJRkVXZCLIt5qwNzuZZIGAJdkFgbwKfRK4UqjBqujKCs2xpdxH2cayxMAPU1wt4
        VChSvjmuj8/iSNVcOVsAOcFE+7G4T7Fm98gswyIEhW2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=/JE/fdBn0uHAF/reu
        WXJArsbuxbUtZ2QdHblap0c0Ec=; b=UMub0WXqmf9A/8hF5d4lMcY4img73ayXF
        H+Czwf48uO+VM2Z8TDDpFCCiAibfrXAV1SToFCMbbyrfiazAy+z1/RJ6sL2RAh7t
        jDb65qSswmdYOmsKqQ9YHVK9LgEn6lSQaqg0j/lCpXHJ1CQ1zC++HHJOB6Ir9M3S
        Yf1+OSZXtz3H7Ji2M7hh0CVhxku++k/qePN8NNTeu3RVAP3XUTF1jvL5D+Ms/F1z
        OnwLmeL6hMQcV02WObVJLLpIoIIvvPJNBu2vH9BVdeSpiULHccHod0KC9+p3+3+r
        fKHMRKlDmwnj0DT1bQ/4XSQcEUwaght6ClNnhwS8ieN8S1W5L7f8w==
X-ME-Sender: <xms:69cgYNfh5p9RHpES_6febetT0bk_zzD4Yp9P-V_F9P5qscsys8ltmA>
    <xme:69cgYLNuX3DoP-vCm1VrSz5BhfBEO88IYFnLlbynIb7M6tEL_Mak6lz-tlZZR8muH
    FpXDO-ErmM8seEa3g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrhedvgdelvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghlucfj
    ohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrfgrth
    htvghrnhepieetkefhheduudfgledtudefjeejfeegveehkeeufffhhfejkeehiefftdev
    tdevnecukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdho
    rhhg
X-ME-Proxy: <xmx:69cgYGhMe9QCTtxi-KH46MfUI8x5kSRVhweJaM0a8JMDVRqA4hpDhQ>
    <xmx:69cgYG9k6CNEbs4qRiBRbMt0ACfkKLLjb0m7J1mE3_At63KqgTAvrQ>
    <xmx:69cgYJtBxig23ux22Pn9WewKVU75wbgzsciJQmvfDPwbuRzYCmYfUQ>
    <xmx:7NcgYBIswmHcH4t2Q7zd6FYzmAs05s7X-rxeD1HKpP96y8ODpCgEBw>
Received: from titanium.stl.sholland.net (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
        by mail.messagingengine.com (Postfix) with ESMTPA id 1B99B240057;
        Mon,  8 Feb 2021 01:19:23 -0500 (EST)
From:   Samuel Holland <samuel@sholland.org>
To:     Gregory CLEMENT <gregory.clement@bootlin.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH] i2c: mv64xxx: Fix check for missing clock
Date:   Mon,  8 Feb 2021 00:19:22 -0600
Message-Id: <20210208061922.10073-1-samuel@sholland.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In commit e5c02cf54154 ("i2c: mv64xxx: Add runtime PM support"), error
pointers to optional clocks were replaced by NULL to simplify the resume
callback implementation. However, that commit missed that the IS_ERR
check in mv64xxx_of_config should be replaced with a NULL check. As a
result, the check always passes, even for an invalid device tree.

Fixes: e5c02cf54154 ("i2c: mv64xxx: Add runtime PM support")
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 drivers/i2c/busses/i2c-mv64xxx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-mv64xxx.c b/drivers/i2c/busses/i2c-mv64xxx.c
index b03c344323d1..c590d36b5fd1 100644
--- a/drivers/i2c/busses/i2c-mv64xxx.c
+++ b/drivers/i2c/busses/i2c-mv64xxx.c
@@ -813,7 +813,7 @@ mv64xxx_of_config(struct mv64xxx_i2c_data *drv_data,
 	 * need to know tclk in order to calculate bus clock
 	 * factors.
 	 */
-	if (IS_ERR(drv_data->clk)) {
+	if (!drv_data->clk) {
 		rc = -ENODEV;
 		goto out;
 	}
-- 
2.26.2

