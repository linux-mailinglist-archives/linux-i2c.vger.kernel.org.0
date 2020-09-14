Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7204F26930D
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Sep 2020 19:23:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726310AbgINRXq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Sep 2020 13:23:46 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:46225 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726456AbgINM2t (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Sep 2020 08:28:49 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 262255C0163;
        Mon, 14 Sep 2020 08:28:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Mon, 14 Sep 2020 08:28:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
        :to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm3; bh=cUZC23CicaaXAfmqyj6n+ANwZq
        esQCZzdFgBl1E/GJU=; b=l1EVmPd9zPTpjgcbmxd1MilFeGI56Q9oZlvXH74tPG
        7iDhvsEq/F5+UrZ7Qu1+vpmD4/DWAX3JwRaC7b81kc/byrfEiQ97KBv0F0wApP/M
        Ef9BQgjOnMV40ytdY+mnc3LuV/9/TxvC9hEy3nr/Owx8FBginNn35v02rxZFs6c6
        6es63LKotaJ7JXszo+2zHPui+5B3uuG3jF9UY/mdkmSkQG0HJrLdgmNC4AXgEdjF
        SY5LAj9qyIm38axTQWm9CTN78PPbKwGqnB1TrGZ37iF6nzeVusaPYxWCUy5b+t05
        /BL7gg4GAJKySOJ4qTY4Z4KDxZyoE0ozILWGqX8FnHgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=cUZC23CicaaXAfmqy
        j6n+ANwZqesQCZzdFgBl1E/GJU=; b=g6bhWMI0cumXoosAtsBgcU3Y0cjdDy3Ga
        i073fwO5IjFtPm3WD42XouIodeEWNy8mt4+phOi37jOIIs+mG0ICudca6UE2SYyU
        8z6N183MFv9f1ZV3AK9LsToNnf4pQWfDzvx9cMeEnIzUu/BxnTc8zz62+c/HYX54
        sUbkld3qgF3mNaOC8dWw171eFTaz7qg74jCE6ZBjKpGiFfd1dQ8+ZN+dwgATNnjo
        NzK7+1aaeFJmArh3p/vGCEyMAIichVTIDjp2nQ+jUpaR6OnFSYwjgs5EQX9E5xXd
        PRL+VvrFAK2cpaNZdE7cO88APq+nJpAKDf0bO/vFjCBW3gc4SbB0Q==
X-ME-Sender: <xms:_WFfXwBfavUXoGUOAdaab0VF_qnHgbhGI08jwHl8T--b8dsiwIW7Lg>
    <xme:_WFfXyiPmusa4HsKt-dPnLBQCCt6m6GnXdFjL-sdMBF7oFPdi7G9_XU_2ONMDYG_M
    0h7PC4XonLXWmfrMQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudeiiedgheefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
    dttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegrjhdr
    ihgurdgruheqnecuggftrfgrthhtvghrnhepkefhieffjeevfeevhedtieeihfefvdejle
    dvvddthefftedujeethfeuueelfedtnecukfhppedugedrvddruddtledrkeehnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifse
    grjhdrihgurdgruh
X-ME-Proxy: <xmx:_WFfXzk8rc3_FDv_FJpuFIsaydHlQMDtUgCoZQeaqfoGWV6Yd_9snw>
    <xmx:_WFfX2xGTW6s87KvnRKQNDbmtKikxMogWXExaxqeKphBt01b5_q7rA>
    <xmx:_WFfX1TI_zNy3r9jyrTbk5sLVLmSjbWwUMvgB6b-X0IR_O-V5zg2JA>
    <xmx:_mFfXzNGkZu6VNtkBcKPP5K0NI9e7gX52frX60NBBV-dEq6uCF2UfQ>
Received: from localhost.localdomain (ppp14-2-109-85.adl-apt-pir-bras32.tpg.internode.on.net [14.2.109.85])
        by mail.messagingengine.com (Postfix) with ESMTPA id 4E6E7306467D;
        Mon, 14 Sep 2020 08:28:42 -0400 (EDT)
From:   Andrew Jeffery <andrew@aj.id.au>
To:     linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, wsa@kernel.org,
        joel@jms.id.au, linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/2] Throttle I2C transfers to UCD9000 devices
Date:   Mon, 14 Sep 2020 21:58:09 +0930
Message-Id: <20200914122811.3295678-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello,

While working with system designs making use of TI's UCD90320 Power
Sequencer we've found that communication with the device isn't terribly
reliable.

It appears that back-to-back transfers where commands addressed to the
device are put onto the bus with intervals between STOP and START in the
neighbourhood of 250us or less can cause bad behaviour. This primarily
happens during driver probe while scanning the device to determine its
capabilities.

We have observed the device causing excessive clock stretches and bus
lockups, and also corruption of the device's volatile state (requiring it
to be reset).  The latter is particularly disruptive in that the controlled
rails are brought down either by:

1. The corruption causing a fault condition, or
2. Asserting the device's reset line to recover

A further observation is that pacing transfers to the device appears to
mitigate the bad behaviour. We're in discussion with TI to better
understand the limitations and at least get the behaviour documented.

This short series implements the mitigation in terms of a throttle in the
i2c_client associated with the device's driver. Before the first
communication with the device in the probe() of ucd9000 we configure the
i2c_client to throttle transfers with a minimum of a 1ms delay (with the
delay exposed as a module parameter).

The series is RFC for several reasons:

The first is to sus out feelings on the general direction. The problem is
pretty unfortunate - are there better ways to implement the mitigation?

If there aren't, then:

I'd like thoughts on whether we want to account for i2c-dev clients.
Implementing throttling in i2c_client feels like a solution-by-proxy as the
throttling is really a property of the targeted device, but we don't have a
coherent representation between platform devices and devices associated
with i2c-dev clients. At the moment we'd have to resort to address-based
lookups for platform data stashed in the transfer functions.

Next is that I've only implemented throttling for SMBus devices. I don't
yet have a use-case for throttling non-SMBus devices so I'm not sure it's
worth poking at it, but would appreciate thoughts there.

Further, I've had a bit of a stab at dealing with atomic transfers that's
not been tested. Hopefully it makes sense.

Finally I'm also interested in feedback on exposing the control in a little
more general manner than having to implement a module parameter in all
drivers that want to take advantage of throttling. This isn't a big problem
at the moment, but if anyone has thoughts there then I'm happy to poke at
those too.

Please review!

Andrew

Andrew Jeffery (2):
  i2c: smbus: Allow throttling of transfers to client devices
  hwmon: (pmbus/ucd9000) Throttle SMBus transfers to avoid poor
    behaviour

 drivers/hwmon/pmbus/ucd9000.c |   6 ++
 drivers/i2c/i2c-core-base.c   |   8 +-
 drivers/i2c/i2c-core-smbus.c  | 149 +++++++++++++++++++++++++++-------
 drivers/i2c/i2c-core.h        |  22 +++++
 include/linux/i2c.h           |   3 +
 5 files changed, 157 insertions(+), 31 deletions(-)

-- 
2.25.1

