Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 650AB4E5AFD
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Mar 2022 23:00:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345070AbiCWWBo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Mar 2022 18:01:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229908AbiCWWBn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Mar 2022 18:01:43 -0400
X-Greylist: delayed 454 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 23 Mar 2022 15:00:11 PDT
Received: from smtp1.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1CFE593A2;
        Wed, 23 Mar 2022 15:00:11 -0700 (PDT)
Received: from hi2exch02.adit-jv.com (hi2exch02.adit-jv.com [10.72.92.28])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 483E13C003B;
        Wed, 23 Mar 2022 22:52:35 +0100 (CET)
Received: from lxhi-065 (10.72.94.3) by hi2exch02.adit-jv.com (10.72.92.28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.21; Wed, 23 Mar
 2022 22:52:34 +0100
Date:   Wed, 23 Mar 2022 22:52:29 +0100
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
CC:     Eugeniu Rosca <erosca@de.adit-jv.com>,
        <linux-renesas-soc@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Bhuvanesh Surachari <bhuvanesh_surachari@mentor.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [PATCH v2] i2c: rcar: add SMBus block read support
Message-ID: <20220323215229.GA9403@lxhi-065>
References: <20210922160649.28449-1-andrew_gabbasov@mentor.com>
 <CAMuHMdVVDpBAQR+H1TAnpf65aVbAL0Mm0km7Z9L7+1JuF6n1gQ@mail.gmail.com>
 <000001d7badd$a8512d30$f8f38790$@mentor.com>
 <20211006182314.10585-1-andrew_gabbasov@mentor.com>
 <Yg6ls0zyTDe7LQbK@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Yg6ls0zyTDe7LQbK@kunai>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.72.94.3]
X-ClientProxiedBy: hi2exch02.adit-jv.com (10.72.92.28) To
 hi2exch02.adit-jv.com (10.72.92.28)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Dear Wolfram,
Dear Andrew,
Dear Geert,

A couple of questions and test results below.

On Thu, Feb 17, 2022 at 08:44:51PM +0100, Wolfram Sang wrote:
> Hi Andrew,
> 
> first sorry that it took so long. The reason here is that my original
> plan was to add 256-byte support to RECV_LEN in the I2C core and enable
> it on R-Car afterwards. Sadly, I never found the time to drive this
> forward. So, all RECV_LEN things got stuck for a while :(
> 
> > This patch (adapted) was tested with v4.14, but due to lack of real
> > hardware with SMBus block read operations support, using "simulation",
> > that is manual analysis of data, read from plain I2C devices with
> > SMBus block read request.
> 
> You could wire up two R-Car I2C instances, set up one as an I2C slave
> handled by the I2C testunit and then use the other instance with
> SMBUS_BLOCK_PROC_CALL which also needs RECV_LEN. Check
> Documentation/i2c/slave-testunit-backend.rst for details.

I am obviously not an SMBus expert, but I wonder if simply testing the
PCA9654 I/O Expander with SMBus support on the H3-Salvator-X target
could be acceptable as a test procedure? See some test results below.

> 
> I wonder a bit about the complexity of your patch. In my WIP-branch for
> 256-byte transfers, I have the following patch. It is only missing the
> range check for the received byte, but that it easy to add. Do you see
> anything else missing? If not, I prefer this simpler version because it
> is less intrusive and the state machine is a bit fragile (due to HW
> issues with old HW).
> 
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Date: Sun, 2 Aug 2020 00:24:52 +0200
> Subject: [PATCH] i2c: rcar: add support for I2C_M_RECV_LEN
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/i2c/busses/i2c-rcar.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
> index 217def2d7cb4..e473f5c0a708 100644
> --- a/drivers/i2c/busses/i2c-rcar.c
> +++ b/drivers/i2c/busses/i2c-rcar.c
> @@ -528,6 +528,7 @@ static void rcar_i2c_irq_send(struct rcar_i2c_priv *priv, u32 msr)
>  static void rcar_i2c_irq_recv(struct rcar_i2c_priv *priv, u32 msr)
>  {
>  	struct i2c_msg *msg = priv->msg;
> +	bool recv_len_init = priv->pos == 0 && msg->flags & I2C_M_RECV_LEN;
>  
>  	/* FIXME: sometimes, unknown interrupt happened. Do nothing */
>  	if (!(msr & MDR))
> @@ -542,11 +543,13 @@ static void rcar_i2c_irq_recv(struct rcar_i2c_priv *priv, u32 msr)
>  	} else if (priv->pos < msg->len) {
>  		/* get received data */
>  		msg->buf[priv->pos] = rcar_i2c_read(priv, ICRXTX);
> +		if (recv_len_init)
> +			msg->len += msg->buf[0];
>  		priv->pos++;
>  	}
>  
>  	/* If next received data is the _LAST_, go to new phase. */
> -	if (priv->pos + 1 == msg->len) {
> +	if (priv->pos + 1 == msg->len && !recv_len_init) {
>  		if (priv->flags & ID_LAST_MSG) {
>  			rcar_i2c_write(priv, ICMCR, RCAR_BUS_PHASE_STOP);
>  		} else {
> @@ -889,7 +892,7 @@ static u32 rcar_i2c_func(struct i2c_adapter *adap)
>  	 * I2C_M_IGNORE_NAK (automatically sends STOP after NAK)
>  	 */
>  	u32 func = I2C_FUNC_I2C | I2C_FUNC_SLAVE |
> -		   (I2C_FUNC_SMBUS_EMUL & ~I2C_FUNC_SMBUS_QUICK);
> +		   (I2C_FUNC_SMBUS_EMUL_ALL & ~I2C_FUNC_SMBUS_QUICK);
>  
>  	if (priv->flags & ID_P_HOST_NOTIFY)
>  		func |= I2C_FUNC_SMBUS_HOST_NOTIFY;
> 

############################################################
################# PATCH-INDEPENDENT OUTPUT #################
############################################################

## .config: https://gist.github.com/erosca/690c3e6065b55546e511f9ef8ba59625
## i2c-tools: https://git.kernel.org/pub/scm/utils/i2c-tools/i2c-tools.git/commit/?id=cf3541b8a7

root@rcar-gen3:# uname -r
5.17.0+

root@rcar-gen3:# cat /sys/firmware/devicetree/base/model 
Renesas Salvator-X board based on r8a77951

root@rcar-gen3:# i2cdetect -l     
i2c-7   i2c             e60b0000.i2c                            I2C adapter
i2c-2   i2c             e6510000.i2c                            I2C adapter
i2c-4   i2c             e66d8000.i2c                            I2C adapter
    ^
     ` i2c-4 is the PCA9654 I/O Expander with SMBus protocol support

root@rcar-gen3:# i2cdetect -y -r 4
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:                         -- -- -- -- -- -- -- -- 
10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
20: UU -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
60: UU UU UU UU UU UU -- -- 68 -- UU -- -- -- -- -- 
70: UU UU UU UU UU UU -- --      

############################################################
###################### VANILLA v5.17 #######################
############################################################

root@rcar-gen3:# i2cdetect -F 4
Functionalities implemented by /dev/i2c-4:
I2C                              yes
SMBus Quick Command              no
SMBus Send Byte                  yes
SMBus Receive Byte               yes
SMBus Write Byte                 yes
SMBus Read Byte                  yes
SMBus Write Word                 yes
SMBus Read Word                  yes
SMBus Process Call               yes
SMBus Block Write                yes
SMBus Block Read                 no	<<<--- We aim to enable this
SMBus Block Process Call         no
SMBus PEC                        yes
I2C Block Write                  yes
I2C Block Read                   yes

root@rcar-gen3:# i2cget -y 4 0x68 0 i 8
0x08 0xff 0x06 0xff 0x5f 0xff 0x11 0x08

root@rcar-gen3:# i2cget -y 4 0x68 0 s
Error: Adapter does not have SMBus block read capability

############################################################
#################### ANDREW'S V2 PATCH #####################
############################################################

root@rcar-gen3:# i2cdetect -F 4
Functionalities implemented by /dev/i2c-4:
I2C                              yes
SMBus Quick Command              no
SMBus Send Byte                  yes
SMBus Receive Byte               yes
SMBus Write Byte                 yes
SMBus Read Byte                  yes
SMBus Write Word                 yes
SMBus Read Word                  yes
SMBus Process Call               yes
SMBus Block Write                yes
SMBus Block Read                 yes 	<<<--- Enabled (tested below)
SMBus Block Process Call         no
SMBus PEC                        yes
I2C Block Write                  yes
I2C Block Read                   yes

root@rcar-gen3:# i2cget -y 4 0x68 0 i 8
0x08 0xff 0x06 0xff 0x5f 0xff 0x11 0x08

root@rcar-gen3:# i2cget -y 4 0x68 0 s
0x08 0xff 0x06 0xff 0x5f 0xff 0x11 0x08

############################################################
##################### WOLFRAM'S PATCH ######################
############################################################

root@rcar-gen3:# i2cdetect -F 4
Functionalities implemented by /dev/i2c-4:
I2C                              yes
SMBus Quick Command              no
SMBus Send Byte                  yes
SMBus Receive Byte               yes
SMBus Write Byte                 yes
SMBus Read Byte                  yes
SMBus Write Word                 yes
SMBus Read Word                  yes
SMBus Process Call               yes
SMBus Block Write                yes
SMBus Block Read                 yes	<<<--- Enabled (tested)
SMBus Block Process Call         yes	<<<--- Enabled (not tested)
SMBus PEC                        yes
I2C Block Write                  yes
I2C Block Read                   yes

root@rcar-gen3:# i2cget -y 4 0x68 0 i 8
0x08 0xff 0x06 0xff 0x5f 0xff 0x11 0x08

root@rcar-gen3:# i2cget -y 4 0x68 0 s
0xff 0x06 0xff 0x5f 0xff 0x11 0x08 0x08

############################################################

Any comments?

Best regards,
Eugeniu
