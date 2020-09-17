Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41ECC26D015
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Sep 2020 02:41:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726171AbgIQAlH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Sep 2020 20:41:07 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:42045 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725858AbgIQAlG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 16 Sep 2020 20:41:06 -0400
X-Greylist: delayed 450 seconds by postgrey-1.27 at vger.kernel.org; Wed, 16 Sep 2020 20:41:03 EDT
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 2EEDA5C0C9D;
        Wed, 16 Sep 2020 20:33:31 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
  by compute3.internal (MEProxy); Wed, 16 Sep 2020 20:33:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm3; bh=nitlheN0IsLIrcvvbSsvp3wovHOQpfw
        gG1F9+OPBH+M=; b=Pj1cVpkv+TXoltLKj77sDn+NzDQJ1ZTckutBgtoDUOUNEWa
        TzJ14uJ9hBTQRnuR0b0cv4lHfWERaQjNkF5vpOp59DsVXjUxL+F+4tSkAofngHm+
        mvgfNChrj3MKgOl8DwimAUbzvN+NKW2urssktHTlf1jMMOX0bSW2kzc0oDxrrfqJ
        4/LdwHJXKpQkuY2jbc7YPHgtSgrzSYS3xE1UCIux2IkiA3Kcp4g6HpET24wc/YHu
        CckJG13bYLJ6ysp/eIBvNTB0322DGrPJhebiedrTaXWA0y+VyirRPq07lnm9H5aU
        VvMDKtdssrBShdPOTtDsan4e+D/L3aWDkkQzlIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=nitlhe
        N0IsLIrcvvbSsvp3wovHOQpfwgG1F9+OPBH+M=; b=GLF+i8ktV0YKu27g4QYc+Y
        /rNY9EDg5tpFMGFI5/WaW+PXWB21QSLrKzUCgDrJ30cp+c04J4xQj+1exuU2Xl0t
        FvW2DUxXNvZdubp8PPqxIyAgObbbqwkX9ujV5Eo5HNuiRjPEQYZfA8fEl9WeRUsh
        RaW74PF1URcmwJJ0g8pwHsZLSiglCXjVtb7hz2aZUs2T8h92z5TQ5dgFWBPLsfBB
        qoqoDr+LJTvX94B8JJc3gNxGptnWw6H9kDjc/3jEljnIYBYCImdYZuOb+PmreRxb
        9ao4x5sXBHp4TJm/UL5an8KAuDQtQ/MqakTRmygSIrVb8DGV2fJ1LqW6o7oMJNuA
        ==
X-ME-Sender: <xms:2q5iX3xh5q7gaj3fKjMgVDAiYg2Zt1Igwtnyw7cYxXEIYeL_Nc1f5g>
    <xme:2q5iX_QF8yGZ8iLhTWhPZZ8IRqQ16hvcl325GtqjSBOH1GMTMXhme6ZS1Sq5nhn7v
    rP4EOntaWA-3gq6JA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrtdefgdefhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
    vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
    htthgvrhhnpedutddtkeeugeegvddttdeukeeiuddtgfeuuddtfeeiueetfeeileettedv
    tdfhieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:2q5iXxUZI9hkWQ5zOKi8KR-M8falIWTKEjpHTWUoOrPTC2syiGxw-Q>
    <xmx:2q5iXxj4uSmznpQIRjJ5tpcrnu9fJCsUIVf4qtqQfBVn9deZJ64Zag>
    <xmx:2q5iX5D2d5uTzaHuTBybNmA59sCSc3eiKtF31kMXFxQoKtiuWSCwuQ>
    <xmx:265iX09Ms89duDK2ZOAmLv22D9KOXSonoDUqGp8AXLLYW4yUaOkWPw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 89E9FE00D1; Wed, 16 Sep 2020 20:33:29 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-324-g0f99587-fm-20200916.004-g0f995879
Mime-Version: 1.0
Message-Id: <61537381-b1ea-48d3-b445-a33e355f8338@www.fastmail.com>
In-Reply-To: <20200916155651.GA90122@roeck-us.net>
References: <20200914122811.3295678-1-andrew@aj.id.au>
 <20200914122811.3295678-3-andrew@aj.id.au>
 <71067b18-c4bc-533a-0069-f21069c5fd0d@roeck-us.net>
 <48962472-b025-4b0d-90e9-60469bebf206@www.fastmail.com>
 <20200916155651.GA90122@roeck-us.net>
Date:   Thu, 17 Sep 2020 10:03:09 +0930
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Guenter Roeck" <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
        "Jean Delvare" <jdelvare@suse.com>, wsa@kernel.org,
        "Joel Stanley" <joel@jms.id.au>, linux-kernel@vger.kernel.org
Subject: =?UTF-8?Q?Re:_[RFC_PATCH_2/2]_hwmon:_(pmbus/ucd9000)_Throttle_SMBus_tran?=
 =?UTF-8?Q?sfers_to_avoid_poor_behaviour?=
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On Thu, 17 Sep 2020, at 01:26, Guenter Roeck wrote:
> > I've had a look at these two examples. As you suggest the delays in zl6100.c 
> > look pretty similar to what this series implements in the i2c core. I'm finding 
> > it hard to dislodge the feeling that open-coding the waits is error prone, but 
> > to avoid that and not implement the waits in the i2c core means having almost 
> > duplicate implementations of handlers for i2c_smbus_{read,write}*() and 
> > pmbus_{read,write}*() calls in the driver.
> > 
> 
> Not sure I can follow you here. Anyway, it seems to me that you are set on
> an implementation in the i2c core. I personally don't like that approach,

Not really set on it, but it does seem convenient. I'm looking at whether 
delays resolve the issues we have with the max31785 as well (I have a bunch of 
patches that introduce retries under the various circumstances we've hit poor 
behaviour).

> but I'll accept a change in the ucd9000 driver to make use of it. Please
> leave the zl6100 code alone, though - it took me long enough to get that
> working, and I won't have time to test any changes.

No worries. If you don't have time to test changes it reduces the motivation to 
find a general approach, and so maybe isolating the work-arounds to the ucd9000 
is the way to go.

Thanks for the feedback.

Andrew
