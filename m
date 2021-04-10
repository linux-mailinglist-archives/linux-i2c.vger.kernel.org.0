Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 172DF35AF19
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Apr 2021 18:47:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234392AbhDJQrk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 10 Apr 2021 12:47:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:51210 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234334AbhDJQrk (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 10 Apr 2021 12:47:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 13F1B6113A;
        Sat, 10 Apr 2021 16:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618073245;
        bh=Jtb2rvXzf2KdmBhOhfX4j1UDxwK2XMDbc9zY8mptJ8E=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=I3hCnVgedtmb2VHZx69Ug1d3uChRk19gKKXaCXite4iIpjgDB4hmltZvF8MErCx4q
         sAMytOnGl7VoB0V9jMvNoC8hwrBRiA3DiO5lXtm6UOP+7GOkn0uclT7LDpbrx1ZlV0
         s2YN4fQJMe9lpi2B8AhEoUE2ejZuqGKRHTpk0NAaA12difjE01w1FdOSOSIU0d7nAT
         32qEMnPu+Otx7t+lv51lainT3eZDwSVSwNNbX+bREPGUuBv1uw4S7rt4Y/yIjBOjS9
         31blxdMT9bkzJ1iP/LokSYBaKJA03tMaPUwOBwBsjQLd4218LhfwJTGflPT139LaX7
         Jq8cdKo3Glo0w==
Date:   Sat, 10 Apr 2021 18:47:21 +0200
From:   Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        Gregory CLEMENT <gregory.clement@bootlin.com>
Cc:     Samuel Holland <samuel@sholland.org>,
        Ondrej Jirman <megous@megous.com>
Subject: Re: [PATCH] i2c: mv64xxx: Fix random system lock caused by runtime
 PM
Message-ID: <20210410184721.4da45a78@thinkpad>
In-Reply-To: <20210408020000.21914-1-kabel@kernel.org>
References: <20210408020000.21914-1-kabel@kernel.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu,  8 Apr 2021 04:00:00 +0200
Marek Beh=C3=BAn <kabel@kernel.org> wrote:

> e5c02cf54154 ("i2c: mv64xxx: Add runtime
> PM support").

This commit should also contain a Fixes tag:

Fixes: e5c02cf54154 ("i2c: mv64xxx: Add runtime PM support").
