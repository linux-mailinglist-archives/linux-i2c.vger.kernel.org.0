Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 302447E1396
	for <lists+linux-i2c@lfdr.de>; Sun,  5 Nov 2023 14:18:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229779AbjKENSR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 5 Nov 2023 08:18:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229707AbjKENSR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 5 Nov 2023 08:18:17 -0500
X-Greylist: delayed 1240 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 05 Nov 2023 05:18:12 PST
Received: from mx1.mythic-beasts.com (mx1.mythic-beasts.com [IPv6:2a00:1098:0:86:1000:0:2:1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6341BB
        for <linux-i2c@vger.kernel.org>; Sun,  5 Nov 2023 05:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=isbd.co.uk;
        s=mythic-beasts-k1; h=Subject:To:From:Date;
        bh=Oi1p78ZkHYyXYvn7ApQPRJ6hOpRX0qKHi7vKVezkmew=; b=gsjvswbb1CK5njjwB9Gzokxs0R
        RooR4xodWRMGLlHITb7WpWZi1OWRq2RESZ16YFsHFr6C8TtxpIN7Nki0jypxZZ35rF3JlhrK5ca2X
        aHXQlqhszF5Of3Z/oITnRbUs6c6O5bARIpkUJbe/vWQMZEz6cBEiWiln0c7Ndg9KpPUBkPe1dCEND
        K1rG8rIVBC2082frYP0oJGFPiN79OtUicAmuzjmoCXMuW/6V+CRFzgchuIbGXQT8BLvi4QWQLmC40
        veRXIPh6/HTyHnD3IHKLfnBywrRUFSkzOefDOElvN/zqLEEGhzuV0nLklwSXdp4/CVEtMVnC/Et47
        IKJ/l3HA==;
Received: by mailhub-cam-d.mythic-beasts.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <chris@zbmc.eu>)
        id 1qzch3-00FC9g-Sb
        for linux-i2c@vger.kernel.org; Sun, 05 Nov 2023 12:57:33 +0000
Received: by esprimo.zbmc.eu (Postfix, from userid 1000)
        id 247742C0746; Sun,  5 Nov 2023 12:57:31 +0000 (GMT)
Date:   Sun, 5 Nov 2023 12:57:31 +0000
From:   Chris Green <chris@isbd.co.uk>
To:     linux-i2c@vger.kernel.org
Subject: A question about the mutex (or not) in the kernel's I2C handling
Message-ID: <ZUeRO9txnxdImAJG@esprimo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-BlackCat-Spam-Score: 7
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_NEUTRAL,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

I have spent quite a while searching in places such as stackoverflow
and in the docmentation at linux.kernel.org but I haven't found a very
conclusive answer (no to me anyway).

I have a single I2C bus connected to a single board computer
(Beaglebone Black) running Debian 11, Kernel: 5.10.168.

Is it safe to allow multiple processes to read and write various
devices on the I2C bus?  This may be either different processes
accessing the same device or different processes accessing different
devices on the I2C bus.

I.e. is there a mutex (or equivalent code) in the Linux Kernel I2C
drivers that guarantees completion of one process's I2C transaction
before another one starts?

The information I have managed to find suggests that there is such a
mutex and that I don't need to make sure my processes don't try to
read/write the I2C bus simultaneously but I can't find a definitive
statement to this effect.

So, I'm sorry to ask such a 'user' question here but I would really
like a definite answer please.

-- 
Chris Green
