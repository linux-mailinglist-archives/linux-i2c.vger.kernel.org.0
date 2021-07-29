Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E001A3D9ED8
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Jul 2021 09:38:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235519AbhG2Hix (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 29 Jul 2021 03:38:53 -0400
Received: from relay2.uni-heidelberg.de ([129.206.119.212]:39690 "EHLO
        relay2.uni-heidelberg.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235587AbhG2HiR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 29 Jul 2021 03:38:17 -0400
X-Greylist: delayed 429 seconds by postgrey-1.27 at vger.kernel.org; Thu, 29 Jul 2021 03:38:17 EDT
X-IPAS-Result: =?us-ascii?q?A2B/BQCzWAJh/1BqzoFagQmEZhVWbIRHoi2LK4FzAQEBA?=
 =?us-ascii?q?QEBAQEBCTcHAQIEAQGHVQIlOBMCBAEBAQEDAgMBAQEBAQEDAQEGAQEBAQEGB?=
 =?us-ascii?q?IEOhWgNhmwwJjUCJgIWKDSCcoMHD6lggTGBAYNNAYRSgUAdBoEQKo4VEIFVR?=
 =?us-ascii?q?IQKboJLgT8FARIBboJKNoIuBIMSgUFURKxGkWosB4IAgSmBNwuIdZNvBBYrl?=
 =?us-ascii?q?UyRF5BWkWmZA4F3gQ1wMxokgzhQGQ6XJIVMQi8CNgIGCwEBAwlZAQGJdQEB?=
IronPort-HdrOrdr: A9a23:XnMaGKsZmb/I213QTZsCc6iw7skDcdV00zEX/kB9WHVpm62j9/
 xG+c5x6faaslwssQ4b6LS90cW7LE8036QFgrX5RI3SPjUO4VHYSb2KjrGC/9SDIULDH4dmvM
 9dmsNFZuEYY2IXsS+02njeLz9Z+qjgzJyV
X-IronPort-Anti-Spam-Filtered: true
Received: from lemon.iwr.uni-heidelberg.de ([129.206.106.80])
  by relay2.uni-heidelberg.de with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 29 Jul 2021 09:31:02 +0200
Received: from hlauer by lemon.iwr.uni-heidelberg.de with local (Exim 4.92)
        (envelope-from <hlauer@lemon.iwr.uni-heidelberg.de>)
        id 1m90VQ-0002Iy-Sc; Thu, 29 Jul 2021 09:31:00 +0200
Date:   Thu, 29 Jul 2021 09:31:00 +0200
From:   Hermann Lauer <Hermann.Lauer@iwr.uni-heidelberg.de>
To:     gregory.clement@bootlin.com
Cc:     linux-i2c@vger.kernel.org
Subject: I2C MV64XXX: Showing Allwinner debug LCR register in bus lock case
Message-ID: <20210729073100.GA8757@lemon.iwr.uni-heidelberg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Dear Maintainers,

if Allwinner i2c locks, the is a LCR register (reg_base + 0x20),
which shows directly the state of the SCL and SDA lines. So you can
see which line (if any) is pulled externally low.

Is there a similar usefull register in the original MV64XXX MARVELL chip?

I'd like to make the patch https://bitbucket.org/hlauer/kernel/src/master/patches/i2c-buslock.patchl working for that chip, too.

Thanks for any ideas.

Greetings
  Hermann

-- 
Administration/Zentrale Dienste, Interdiziplinaeres 
Zentrum fuer wissenschaftliches Rechnen der Universitaet Heidelberg
IWR; INF 205; 69120 Heidelberg; Tel: (06221)54-14405 Fax: -14427
Email: Hermann.Lauer@iwr.uni-heidelberg.de
