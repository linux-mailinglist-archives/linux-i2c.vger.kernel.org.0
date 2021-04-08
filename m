Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5FB5358FAF
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Apr 2021 00:13:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232372AbhDHWNz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Apr 2021 18:13:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232265AbhDHWNz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Apr 2021 18:13:55 -0400
Received: from mail.enpas.org (zhong.enpas.org [IPv6:2a03:4000:2:537::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6E346C061760;
        Thu,  8 Apr 2021 15:13:43 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        by mail.enpas.org (Postfix) with ESMTPSA id 09DD7FF95A;
        Thu,  8 Apr 2021 22:13:38 +0000 (UTC)
Date:   Fri, 9 Apr 2021 00:13:35 +0200
From:   Max Staudt <max@enpas.org>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/12] i2c: icy: Constify the software node
Message-ID: <20210409001335.2d3b9484.max@enpas.org>
In-Reply-To: <20210408212251.GJ1900@kunai>
References: <20210329105047.51033-1-heikki.krogerus@linux.intel.com>
        <20210329105047.51033-10-heikki.krogerus@linux.intel.com>
        <20210330155856.3cf32fce.max@enpas.org>
        <20210408212251.GJ1900@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 8 Apr 2021 23:22:51 +0200
Wolfram Sang <wsa@kernel.org> wrote:

> I read this as "Reviewed-by" ;)

Sure, why not :)


Reviewed-by: Max Staudt <max@enpas.org>
