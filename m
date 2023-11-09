Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D7347E6929
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Nov 2023 12:07:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231849AbjKILHB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Nov 2023 06:07:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231270AbjKILHA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Nov 2023 06:07:00 -0500
X-Greylist: delayed 958 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 09 Nov 2023 03:06:57 PST
Received: from mx2.mythic-beasts.com (mx2.mythic-beasts.com [IPv6:2a00:1098:0:82:1000:0:2:1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63FD52590
        for <linux-i2c@vger.kernel.org>; Thu,  9 Nov 2023 03:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=isbd.net;
        s=mythic-beasts-k1; h=Subject:To:From:Date;
        bh=hs+tl8q6DXI0R8uHTp5mVmXkrhwAYT/6hZlwFDKvZ7o=; b=E8bj+UdthJZY2EcoN4Fi1zjbqZ
        KWqPP4bkVmVMGctk3YKRzBJLqLZSmxHLKMjDZGNkR4WLlWE2VQDIs3FfD31CtF/Wun/B1dvdpI/ur
        Se6GvQCM70c5d26ol+bOukHpiRZikhPjl7IJqZ6iZUSiZqaan4wcwTC8RyCAXdWKtL8AS4wNju7Gx
        LIW0duTREeJfAKxJroproJUcoplIrR7PC1XL0kVL1YXLoomgUDHg/iliphowlSnW1iOJDqbo3Ux0t
        YDZHz6DvukB43bWpAa2rHOUAEAauMi2FWMOTRXGGogfi8tfokdNymDgUqGF5+T9y+upgWv0u9lu1c
        b/V7LU9w==;
Received: by mailhub-hex-d.mythic-beasts.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <chris@zbmc.eu>)
        id 1r12cm-0077wm-Q8
        for linux-i2c@vger.kernel.org; Thu, 09 Nov 2023 10:51:00 +0000
Received: by esprimo.zbmc.eu (Postfix, from userid 1000)
        id 27AA82C0417; Thu,  9 Nov 2023 10:50:58 +0000 (GMT)
Date:   Thu, 9 Nov 2023 10:50:58 +0000
From:   Chris Green <cl@isbd.net>
To:     linux-i2c@vger.kernel.org
Subject: Re: A question about the mutex (or not) in the kernel's I2C handling
Message-ID: <ZUy5knTEWw0aycE5@esprimo>
Mail-Followup-To: linux-i2c@vger.kernel.org
References: <ZUeRO9txnxdImAJG@esprimo>
 <20231108225028.k426cvitpvbcnuyj@porty>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231108225028.k426cvitpvbcnuyj@porty>
X-BlackCat-Spam-Score: 7
X-Spam-Status: No, score=0.7
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Nov 08, 2023 at 11:50:28PM +0100, Stefan Lengfeld wrote:
[snip long, comprehensive, reply]

Stefan, thank you so much, that's just what I wanted to be sure about.

-- 
Chris Green
