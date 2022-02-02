Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 223614A6B1F
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Feb 2022 05:58:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244712AbiBBE6i (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Feb 2022 23:58:38 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:40643 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S244707AbiBBE6e (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Feb 2022 23:58:34 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 8823C5C0184;
        Tue,  1 Feb 2022 23:58:33 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Tue, 01 Feb 2022 23:58:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm1; bh=2jdX86hShpK/UN
        KvzNeZzw/hOLvdtjRA6nKA8Ea2EIU=; b=BBiHsZDxoK8fQp8v6Wip5Ct50N64+W
        iNqUAxjX8lIiNWjQs9bu0YbEUbmPm/LerinAikcIepSZZ8b7WxiF14MNhZoKrfVq
        OR5BRsNNuyG2ocUaEdRc+HquHEpcHrMNEbzmEmYlPbWwK1ogVyJt4hZOt28suNMQ
        OKj+n4k/TVTE6ad+6p3hQSWBH9K25cwM+5VmA3ygwGd3zkk2swRdOLY0LI3fS/Eq
        4bL/Fr9Cyr08VmxmnvIY2u/yjibQ+B46XpQOX2tgWz9e+ZZ6fd3gIRVYHV+66Lov
        IRdMt0FD+Ztl656ZlWg63yAe7KUDbbz2JbS2RYoJU9w04fRwgYmvRIog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=2jdX86hShpK/UNKvzNeZzw/hOLvdtjRA6nKA8Ea2E
        IU=; b=XkjyV4kHYVT7Hqad2C9cl6hoL4PimBhA2g9sZmZZQ7HASxZZC2pyyeBml
        surG0mQhNrSwGVORBPh/0mCJMALiCBbTCDsCIYpKQS+OKETS2LrjayIUr8ybfEJa
        Jig93DRpUkzgSkWBoEXc02tk4Ea6diyBwiNZvLhgiOAV/W6Xc3RnHf7ZLTvxdbKH
        vOKHKyvtolPMtWYE8izaFtNPOTTSWqd5lZk/UBvWjU109alZ25gF52pPTcdw0YrV
        c/AMpL9bQOULHpLA0NgzBHzGqcn+VWxDOLXcAB6sgHfA8fOIqQ/0/EYsAHBvbF4u
        jDu6P+xtdu55JL6Bt/v+EZ5nTlSFg==
X-ME-Sender: <xms:eQ_6YdaeOcTQIwz2QmPsAr1ftXNNgUr_wOfWqGAikhPhzAHQKNhhKA>
    <xme:eQ_6YUYBe5oB0Qo9nwZ2jLxLj2IR1PefvMz8Pbc0ds6uyFZH6q-zWr1U1YIDCNXzK
    czaHNGBvwABkZrdmA>
X-ME-Received: <xmr:eQ_6Yf_GbCFwlf2xX1EVRK3Uh3n0OCw7xR3brmR0aTO0J8czkn9gb2e9FIY-E0OwnTbr-ds7oO0CXHM_yYxTv6TgSDEu2UalpWjp6_Y-jDsrAqqMhPHRu_a9Jg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgeeggdejvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefuvfhfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpefgveffteelheffjeeukedvkedviedtheevgeefkeehueeiieeuteeu
    gfettdeggeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:eQ_6YbpAEdC9o9rsrqiCIs1Plfu69IqrUT_Qz-a10D9wkONOcFCBCw>
    <xmx:eQ_6YYpvO0t_V1Ib1kkj8f84BoisJhxA65S8kRnuZRNRrctoYVzLiw>
    <xmx:eQ_6YRQWo24zBiZfSFV-xi_BXWzGl07jMPeGBZakEJLek-CiHHtbQw>
    <xmx:eQ_6YZdlRCp2NIjYfgJrgJowsKqGmMyeUSstjolH6vvkPesBxITq_g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Feb 2022 23:58:32 -0500 (EST)
Subject: Re: [PATCH 3/5] Input: pinephone-keyboard - Build in the default
 keymap
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        Ondrej Jirman <x@xff.cz>
References: <20220129230043.12422-1-samuel@sholland.org>
 <20220129230043.12422-4-samuel@sholland.org> <Yfg8crUuCLO0SxVj@google.com>
From:   Samuel Holland <samuel@sholland.org>
Message-ID: <cf0f85bb-c4ff-a061-ff66-289fe10511c5@sholland.org>
Date:   Tue, 1 Feb 2022 22:58:32 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <Yfg8crUuCLO0SxVj@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 1/31/22 1:45 PM, Dmitry Torokhov wrote:
> Hi Samuel,
> 
> On Sat, Jan 29, 2022 at 05:00:40PM -0600, Samuel Holland wrote:
>> The PinePhone keyboard comes with removable keys, but there is a default
>> layout labeled from the factory. Use this keymap if none is provided in
>> the devicetree.
> 
> Why can't we require to have it in device tree?

We can. I am okay with dropping this patch and making the properties required if
that is preferred.

The keyboard is supported on at least four device trees (three revisions of
PinePhone, plus the PinePhone Pro), so moving the default keymap to the driver
avoids duplicating that block of data in each device tree/overlay.

Regards,
Samuel
