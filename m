Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9ABFA9C8DF
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Aug 2019 07:58:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727797AbfHZF6Y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 26 Aug 2019 01:58:24 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:53831 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726606AbfHZF6Y (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 26 Aug 2019 01:58:24 -0400
Received: from soja.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:13da])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <o.rempel@pengutronix.de>)
        id 1i281G-00016I-Mc
        for linux-i2c@vger.kernel.org; Mon, 26 Aug 2019 07:58:22 +0200
To:     linux-i2c@vger.kernel.org
From:   Oleksij Rempel <o.rempel@pengutronix.de>
Subject: i2c testing
Message-ID: <45126965-fb48-d5a1-d3c7-9bedb6a23d9c@pengutronix.de>
Date:   Mon, 26 Aug 2019 07:58:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:13da
X-SA-Exim-Mail-From: o.rempel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

can you recommend some thing for i2c-imx regression testing? I assume some i2c storage 
devices should be good enough. At least, it is possible to test data integrity.

Any other ideas?

Kind regards,
Oleksij Rempel

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
