Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACF7425138
	for <lists+linux-i2c@lfdr.de>; Tue, 21 May 2019 15:56:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726900AbfEUN4d (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 May 2019 09:56:33 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:41940 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726692AbfEUN4c (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 21 May 2019 09:56:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=aUJZZRLHv52jJphrxyVf6Se7F4GlPP6o6lDgQeElm9Y=; b=lpyEW+F9YVINwDf5xsAz3Mvhmm
        oXx87QYdqdWhbuvfi8fV7EB6Rb2PXNFqTr7Tt2o2n5VxEWaS80Yar0iRI7uJMy1ekjM3rxn6kWNxa
        Zl9OePAd2sjwtbirtAcjtE2uUsm0OS5sbb9an7ripkXAAJv7jdYznefbax8bSVFSORDY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.89)
        (envelope-from <andrew@lunn.ch>)
        id 1hT5Fh-0002zr-NK; Tue, 21 May 2019 15:56:25 +0200
Date:   Tue, 21 May 2019 15:56:25 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Sagar Shrikant Kadam <sagar.kadam@sifive.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, peter@korsgaard.com,
        palmer@sifive.com, paul.walmsley@sifive.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/3] dt-bindings: i2c: extend existing opencore
 bindings.
Message-ID: <20190521135625.GN22024@lunn.ch>
References: <1558445574-16471-1-git-send-email-sagar.kadam@sifive.com>
 <1558445574-16471-2-git-send-email-sagar.kadam@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1558445574-16471-2-git-send-email-sagar.kadam@sifive.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

>  Required properties:
> -- compatible      : "opencores,i2c-ocores" or "aeroflexgaisler,i2cmst"
> +- compatible      : "opencores,i2c-ocores",
> +		    "aeroflexgaisler,i2cmst",
> +                    "sifive,fu540-c000-i2c","sifive,i2c0".
> +		    For Opencore based I2C IP block reimplemented in

It looks like there are some tabs vs space issues here.

   Andrew
