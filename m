Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B4DB34F5CB
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Mar 2021 03:10:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232600AbhCaBK0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Mar 2021 21:10:26 -0400
Received: from ozlabs.org ([203.11.71.1]:52861 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232684AbhCaBKL (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 30 Mar 2021 21:10:11 -0400
Received: by ozlabs.org (Postfix, from userid 1034)
        id 4F97XK5m8mz9sX1; Wed, 31 Mar 2021 12:10:09 +1100 (AEDT)
From:   Michael Ellerman <patch-notifications@ellerman.id.au>
To:     Michael Ellerman <mpe@ellerman.id.au>,
        Paul Mackerras <paulus@samba.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Wolfram Sang <wsa@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-i2c@vger.kernel.org
In-Reply-To: <19e57d16692dcd1ca67ba880d7273a57fab416aa.1616085654.git.christophe.leroy@csgroup.eu>
References: <9c2952bcfaec3b1789909eaa36bbce2afbfab7ab.1616085654.git.christophe.leroy@csgroup.eu> <19e57d16692dcd1ca67ba880d7273a57fab416aa.1616085654.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/embedded6xx: Remove CONFIG_MV64X60
Message-Id: <161715298020.226945.1588774720251975064.b4-ty@ellerman.id.au>
Date:   Wed, 31 Mar 2021 12:09:40 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 18 Mar 2021 17:25:07 +0000 (UTC), Christophe Leroy wrote:
> Commit 92c8c16f3457 ("powerpc/embedded6xx: Remove C2K board support")
> moved the last selector of CONFIG_MV64X60.
> 
> As it is not a user selectable config, it can be removed.

Applied to powerpc/next.

[1/1] powerpc/embedded6xx: Remove CONFIG_MV64X60
      https://git.kernel.org/powerpc/c/a329ddd472fa2af0c19a73b8658898ae7fd658ad

cheers
