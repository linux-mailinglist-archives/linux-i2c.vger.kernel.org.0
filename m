Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41FAA298344
	for <lists+linux-i2c@lfdr.de>; Sun, 25 Oct 2020 20:00:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1418407AbgJYTAB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 25 Oct 2020 15:00:01 -0400
Received: from eu-shark1.inbox.eu ([195.216.236.81]:58178 "EHLO
        eu-shark1.inbox.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1418405AbgJYTAB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 25 Oct 2020 15:00:01 -0400
X-Greylist: delayed 374 seconds by postgrey-1.27 at vger.kernel.org; Sun, 25 Oct 2020 14:59:59 EDT
Received: from eu-shark1.inbox.eu (localhost [127.0.0.1])
        by eu-shark1-out.inbox.eu (Postfix) with ESMTP id C08986C006AC;
        Sun, 25 Oct 2020 20:53:43 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.ee; s=20150108;
        t=1603652023; bh=/L+8Tzs+lfv26ikHJRBktySxIrJHPQ7fcPUYKAnW1XY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References;
        b=Yi1xgLiUlRU7PHtqRn53IVgKTQWVwphtendaBbEFxykj1ac+ho/hKi/x0aBdc26NM
         AWPLeQy/ayXsuFT3U5edwbxd5bygsRA90ut08lj5qvmY9qgSeCOnuNalwk5Fof6a89
         O4MVwwtSlbaZc4eqzsojQoOg56654SxSBt7prssY=
Received: from mail.inbox.eu (eu-pop1 [127.0.0.1])
        by eu-shark1-in.inbox.eu (Postfix) with ESMTP id 9E5E86C006A9;
        Sun, 25 Oct 2020 20:53:43 +0200 (EET)
Received: from hp15 (unknown [185.176.222.57])
        (Authenticated sender: arzamas-16@mail.ee)
        by mail.inbox.eu (Postfix) with ESMTPA id 2BD9E1BE00B2;
        Sun, 25 Oct 2020 20:53:42 +0200 (EET)
Date:   Sun, 25 Oct 2020 21:53:38 +0300
From:   Boris Lysov <arzamas-16@mail.ee>
To:     Qii Wang <qii.wang@mediatek.com>
Cc:     <linux-i2c@vger.kernel.org>, <robh+dt@kernel.org>,
        <matthias.bgg@gmail.com>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: i2c: i2c-mt65xx: Update binding example
Message-ID: <20201025215338.63664268@hp15>
In-Reply-To: <1600049386.25719.7.camel@mhfsdcap03>
References: <20200904223345.3daea5ad@hp15>
        <1599442087.25719.2.camel@mhfsdcap03>
        <20200907180841.0044d571@hp15>
        <1600049386.25719.7.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: OK
X-ESPOL: +dBm1NUOBk3XhyLHXxmqCAcypixLVOnh/+SmqX1UnXP/Ly+DeFYPUhKpmGtqLw+1uyM=
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 14 Sep 2020 10:09:46 +0800
Qii Wang <qii.wang@mediatek.com> wrote:
> None of the examples you cited are the upstream code of our official
> release

Where can I access the official upstream release for both MT6577 and MT6589? Me and other developers would certainly like to research it.

> , and the name of customer's SOC cannot be accurately evaluated. 

I'm sorry, but I don't understand what do you mean by "customer's SOC". I own a device with MT6577, and in all source code bundles I had listed in the previous message the SoCs are either MT6577 or MT6589.

As of now, the code in the example of i2c-mt65xx driver documentation is declared compatible with MT6577, but it clearly does *not* work on actual MT6577 SoC.
