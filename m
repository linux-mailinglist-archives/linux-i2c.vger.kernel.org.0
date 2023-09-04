Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA8817915BA
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Sep 2023 12:33:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235907AbjIDKdt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 4 Sep 2023 06:33:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230121AbjIDKds (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 4 Sep 2023 06:33:48 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2065.outbound.protection.outlook.com [40.107.22.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A57AF0;
        Mon,  4 Sep 2023 03:33:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C+ZI+JfVvbDMXD07v2Oqx/bunllK44i60sYU2w9sBWUMFkiUJXVaZjnGEAMiyLT1fFseoljDVceVKVtGkcjvsb3+zclugjxvb7M4CdtaVA7tT/4xhTL5BlaRwY9jPFrYm8dw6QnS7lTv8Qy3pFChryNKmnJIN04eQOE6quffHKhLoGg4I2dYiSZkRTMy/E9P2xbpttGkAWh19adgXhilE5dBL8V9uAOhiqH7RCKtcWKf3mgFNrPuW4DJarmWMrcLHp0JEECCRaey/2SYYVE/da6Jyp6Uk6Gr1JrPlpqjmdTwJyiA0K/Tc3Tdj6Dn6I7OkT0tDbptooJgAdi3YIGuHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sATWBb8RmfiE8Tuf6vScNwlUZTYmvTy4bWZQX9WRZGA=;
 b=NgfuipJtwYpihUn1N+DjOIRO1gSDFFIIuGB02/OZBaIoIFtRoDbBwiVNDU4yhIjoMXp4bXs8DxVmSTxS6v2lqyIk/rQbjg20dasv1FbioYNwZvKeNWKTqYkwo092nkkVWbQmV8M9d8Rn87HwFqy3dc/7kZqr2EAt3rKFyFxjc0E70XCu6RaJLwKQZypsbOkbAw6cQsHgCgftC0Lxb4mAsLzyPPRWxvMVDzhIRrEiY5gebMqyOC380CE+Oz+JCiJtsJIxuJtwECAYLHy0qAY5uzMfuDSbhgIo0PzGM9wtBsiuqOe8oSXPSIEBEt/slVu6StMNMpGsOlC0mQD3Md+Cgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sATWBb8RmfiE8Tuf6vScNwlUZTYmvTy4bWZQX9WRZGA=;
 b=mFcGugM7I7F4JOvmcRIzZ/hewcFRFpdaEr0oJqCi8vn5SWVUBRbAejPzVc1UbYpS78bXsuaMHP/B5hLRcFRaw3iJPUfA6bZjKD19/sipxytdVFCtvlVOmbwImtGg4bYayHH9Oaj0GSMmcnC8uOqHJKfeeR6FZIBDn+/PbtLO/fOzQ+PN7ehVGcABSmvBsQXrCe4GtW+rXkyFQ7kuuEfEQZGl3DSV7/sk7jbj4rD5WNFLROHkFaZi4yeFek8n3iX6iqxmP6Sn4Z8i1P77QTKliVaQJDtUFG0aHiniKwF4JrRaB74pOuHwrmyqRocY9Im7JvieJefoORymXIv72qjavQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9)
 by AS8PR04MB8150.eurprd04.prod.outlook.com (2603:10a6:20b:3f0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.32; Mon, 4 Sep
 2023 10:33:42 +0000
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::cc91:7bb7:2f06:1cb2]) by VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::cc91:7bb7:2f06:1cb2%4]) with mapi id 15.20.6745.030; Mon, 4 Sep 2023
 10:33:42 +0000
Message-ID: <a8c8af1b-9399-6ca9-ea3d-b71e6ee68cad@suse.com>
Date:   Mon, 4 Sep 2023 12:33:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v14 1/4] usb: Add support for Intel LJCA device
To:     Wentong Wu <wentong.wu@intel.com>, gregkh@linuxfoundation.org,
        arnd@arndb.de, mka@chromium.org, oneukum@suse.com, lee@kernel.org,
        wsa@kernel.org, kfting@nuvoton.com, broonie@kernel.org,
        linus.walleij@linaro.org, hdegoede@redhat.com, maz@kernel.org,
        brgl@bgdev.pl, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-gpio@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        heikki.krogerus@linux.intel.com, andi.shyti@linux.intel.com,
        sakari.ailus@linux.intel.com, bartosz.golaszewski@linaro.org,
        srinivas.pandruvada@intel.com
Cc:     zhifeng.wang@intel.com
References: <1693806261-12958-1-git-send-email-wentong.wu@intel.com>
 <1693806261-12958-2-git-send-email-wentong.wu@intel.com>
Content-Language: en-US
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <1693806261-12958-2-git-send-email-wentong.wu@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0129.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::16) To VI1PR04MB7104.eurprd04.prod.outlook.com
 (2603:10a6:800:126::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7104:EE_|AS8PR04MB8150:EE_
X-MS-Office365-Filtering-Correlation-Id: 2be6f597-eb7f-49a2-2a16-08dbad3268b2
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i5xoanXRk6W6xtV3YmrY7EYQYaesuirz7txxYvP3A2trYCwMXWUF53FjE3XldCunBDGRAz7kyInVyoErBv20J6K7Csn30BJkjZ7ofVG1YsdaLPSG7dtSIaltvjAe463rHXjE7XXEcwY6Ucg1fbKsDMMN5GQX5eIlMzewZqUBeQdWX6ypLyNxr0es19Vt1ntK7fsTVnZrcROAazsgtvBIRgqKVBjFUDxQ1w4Io9g33erzGfzCjJy9YGZtKh09gw9k4nLgWg4M1nZzMGc+u+EnHGNIl38ekxdIyxHdRgJN8y4LuK37K7Qnn6OX19lEmpfkpCqTElpZlS+pG3F4plkOfvlqEHB4wu/cMI6D6w1kqr3asJ2Bo5aBNadgJboxabt3sAyPc3AleBKaDmoTYogF8ZoOCwcGmtUGSBwOV2pDWcXXn5GBk/xpZ/uXHdneJ4nwwXmXDU/fa/ipnr2w0ZKLbtkWDAk8PsLzfc1WLJP4TAE1hlA5rHQvV1YoXT5KD30F/aI9szeTqPZLlkvma3odYyMVULhkfGo9gfcagQdcD+748K5JjCQNPnKAYSPKzajVmsHQUXdA9e+JNYVHbkpoBdwf2/lftD5zCyDtOw1fTYeiBMHP/Ma1cpV1LcvaOON7gvXBrFnp+bLUbx7/Gt4E63n1zE3fq98yFm0OG2wo5Wo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7104.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(376002)(39860400002)(366004)(346002)(186009)(1800799009)(451199024)(41300700001)(7416002)(921005)(38100700002)(6666004)(86362001)(31696002)(478600001)(2616005)(83380400001)(6512007)(53546011)(6506007)(6486002)(36756003)(2906002)(316002)(66476007)(66946007)(66556008)(8936002)(8676002)(31686004)(5660300002)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWNSQmpUM21Vb2xUK2d3WGVsZDZVeDRPWHFFQ0FZcEpuZXg5QmQ4VjBORVhu?=
 =?utf-8?B?QTlLUzlhUE1IdnNocmltUVVqV2kyUy80Y3ZKbTVQMmNNRFF2Z3QvUDFaakxL?=
 =?utf-8?B?MEJMZVQxcm14bnZENjRHT3k4OTF5SGNmUldHY0dwR3p4akxYVEovSmRwQk5L?=
 =?utf-8?B?clJySkhHYUEvekl1bEtHRllMNFU0RzVuTEtka1k4bUlsbDRCeGFHMmFIdFNn?=
 =?utf-8?B?bWNxblJEejlHcHR0TFArbGJic2dybU9jK2hzT2xuaG5LSzZiWE0vWU9NN1dj?=
 =?utf-8?B?SXFwU1ZhUlpRUldkN1VVTm9NRUdyZmJoQkNkS3BSVzhienNFLzI0VDl3MWFR?=
 =?utf-8?B?K2YvSHE2VkhSUkpoNGl4ME9XMlRmNk1iMEVCT3phWFFOMmV0dnVEbU9tOWU5?=
 =?utf-8?B?UndlT0tpWjhaSmtvWHFZZTJrQjZ2dHVZWE1hb3BzUnhTUFpaZ1ZvL0JtSVNW?=
 =?utf-8?B?SjZzTFdMZi9EZHRXNkFJdm1KZ1libE9YREJTRWNoVnRaRWZvdlNzYXlleXhN?=
 =?utf-8?B?V3FmSzB6RE9UTXI4eXNuVEV2WmlPY3FxQ25xUG56dkhlNDRGLzNJL0wveWFm?=
 =?utf-8?B?SXNkRDJzRFhWTkNFQmJIZXhqbEM2dFpWSUhHdjFQU1RWbEcxSEIzWmp6SFV5?=
 =?utf-8?B?dGVhWEo5ME5tNzZjaEUyQ1JKcit2OXQ0eHBGUmEwZEVOM0xJMWNGN1hHUHBE?=
 =?utf-8?B?Zk5aSFYrUVFhWEFMS05xam1sMDZuOC9nZjV5T29wblRMeVZ2OUh5Uzl0OCs5?=
 =?utf-8?B?c1EwRlNwTHNuTVBuWGloUVlFZkRORTFjQnRxVmMzQ2dtWEZadDFGdnFhYVRN?=
 =?utf-8?B?LytyV2hNYmVGZmJtaHhGaStoSExEc3RYaUo2azc2SE1IQ09QcDU2WWgrOERn?=
 =?utf-8?B?dk9QZ1lZQnEvYlVMMlFJcGt3a0pud0FCa3ppeCtqWDZDV2QxVjVuUWVuMXgw?=
 =?utf-8?B?bkY0QktZaVFVZ2Y1QnAvQ1BOZ25nd0U0bXJlekVCbTVaWU9pKzc0aGpzazQ4?=
 =?utf-8?B?cXhJUk1oT1RXa1A4SmYrMlJPNElJRDRHZU81SUZLS1pZWXUxSDdZNXZCVzNm?=
 =?utf-8?B?R1V5dHVlWGlqZUhkSHFHYnVXKzNUUDRTZ3BvQ2t6dndZTkdFL1hIaE9QYkVx?=
 =?utf-8?B?MjZHc2xLUFFsd0dnVCt4YVVObnc5MDExUmZham9PZnkxOXp4MndPdTlocUhF?=
 =?utf-8?B?YUNwRlFlV3lCYkpyeGtQQzBERkZTbjBsOUFTdldISTNxRHRjY3hTOUtucHFS?=
 =?utf-8?B?WGVHdW1YVmtPNjRrRFFPckNZeG0xbHZTNFB5cE5leFBrQS9Pb3hBYnpsd0la?=
 =?utf-8?B?WUpoZ3RhTXFQeFZpZ1QzYlg3UFdKZWdCY2VmM29OTkdvc2NxVWJ2Ny9GMHFi?=
 =?utf-8?B?T3N2UlFmb2RYYTJtUWJpQ3RSTm5QRlErN3VJTjJ3S3poSDdGdjZ4OHllVmUy?=
 =?utf-8?B?QTg0MWJEdFNlQ0NDa0o3aGkzNlBQd1dkRDJTU1RLNU8xQWJER2lMUHBoVm5r?=
 =?utf-8?B?RFpKQjc4MFk0YWtmM0NuVDNEdEd2Q2I1Q1EvZEhsRDIxaXc0d3Y3V082MmJ1?=
 =?utf-8?B?MDhlcng4cTVlMXMxa1NpTU13U2hZSWhHNjV2QnB5bFlGUXRKYThKZmxCUGM1?=
 =?utf-8?B?djNTcW9NMmt1aDNsQzAzRWFteG1YRmhvNlZLZUh1MDZpTm4rVEt2bFJQelhz?=
 =?utf-8?B?NEhQQXNkMVF0QnBIWEpMdEhhS1NEV2hEb3hLb1d2eFRDa2ozS041cWxNUTNm?=
 =?utf-8?B?U0hhWkJ0ZGg4RTR0WGxZak1uSXo1VkNNN0gyTksxcEw5UnVPampEV2xKSHli?=
 =?utf-8?B?c0Z2STA2c3NZaVBXeWpobFdndDYxQW5YdnVrZ0pubTdrQmNHMXRodHZpRU9N?=
 =?utf-8?B?S0VSWEpmbm1jYWVJQUJXRlpBOS9zMk1LanBDNHliZndwKzdSbWFDeVkyQkk3?=
 =?utf-8?B?dkhtVDhrUGxYY1RlUlVrWDFoTVg5Vi91ZFlNc2Q0eWpxOGFOTGo5OXpMRExZ?=
 =?utf-8?B?VHpCZ2FEL2FXNndSUmNPWFVnaVNlYnhUNEFNSThzRnZMaEY0MlRBTEZjL1hk?=
 =?utf-8?B?NVJvQkVsbkNYTkVLSDkxSWUwSEpQYTZhWW9KSHRHRW9ndDJGZ1BUVTdnaGFy?=
 =?utf-8?B?MnBJcTl3RkdVaERxckpUcmc3cnVLR1JoUXp3WjNPczJFbXNKa3A2VHN5SEZ2?=
 =?utf-8?Q?h5jGKjryKR7/jDfoDDiuqVR8hEEqV3+jIo9T7iaBkKHb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2be6f597-eb7f-49a2-2a16-08dbad3268b2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7104.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2023 10:33:42.3673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zEMR/gMoktdnNKpy23eNIEmB2nj3cGnCa8PFM3LprTySF6/Ny/CdIaxH2Sc9cru3wSy7rwYnoyoAoz/ut4hQgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8150
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 04.09.23 07:44, Wentong Wu wrote:

> +static int ljca_send(struct ljca_adapter *adap, u8 type, u8 cmd,
> +		     const void *obuf, unsigned int obuf_len, void *ibuf,
> +		     unsigned int ibuf_len, bool ack, unsigned long timeout)
> +{
> +	unsigned int msg_len = sizeof(struct ljca_msg) + obuf_len;
> +	struct ljca_msg *header = adap->tx_buf;
> +	unsigned long flags;
> +	unsigned int actual;
> +	int ret = 0;
> +
> +	if (msg_len > adap->tx_buf_len)
> +		return -EINVAL;
> +
> +	mutex_lock(&adap->mutex);
> +
> +	spin_lock_irqsave(&adap->lock, flags);
> +
> +	header->type = type;
> +	header->cmd = cmd;
> +	header->len = obuf_len;
> +	if (obuf)
> +		memcpy(header->data, obuf, obuf_len);
> +
> +	header->flags = LJCA_CMPL_FLAG | (ack ? LJCA_ACK_FLAG : 0);
> +
> +	adap->ex_buf = ibuf;
> +	adap->ex_buf_len = ibuf_len;
> +	adap->actual_length = 0;
> +
> +	spin_unlock_irqrestore(&adap->lock, flags);
> +
> +	reinit_completion(&adap->cmd_completion);
> +
> +	usb_autopm_get_interface(adap->intf);
> +
> +	ret = usb_bulk_msg(adap->usb_dev, adap->tx_pipe, header,
> +			   msg_len, &actual, LJCA_WRITE_TIMEOUT_MS);
> +	if (!ret && ack) {
> +		ret = wait_for_completion_timeout(&adap->cmd_completion,
> +						  timeout);

Let's suppose we are here, when a device is unplugged.
timeout is arbitrary as it is passed down to us.

> +		if (ret < 0) {
> +			goto out;
> +		} if (!ret) {
> +			ret = -ETIMEDOUT;
> +			goto out;
> +		}
> +	}
> +	ret = adap->actual_length;
> +
> +out:
> +	spin_lock_irqsave(&adap->lock, flags);
> +	adap->ex_buf = NULL;
> +	adap->ex_buf_len = 0;
> +
> +	memset(header, 0, sizeof(*header));
> +	spin_unlock_irqrestore(&adap->lock, flags);
> +
> +	usb_autopm_put_interface(adap->intf);
> +
> +	mutex_unlock(&adap->mutex);
> +
> +	return ret;
> +}
> +

[..]

> +static void ljca_disconnect(struct usb_interface *interface)
> +{
> +	struct ljca_adapter *adap = usb_get_intfdata(interface);
> +	struct ljca_client *client, *next;
> +
> +	usb_kill_urb(adap->rx_urb);
> +
> +	list_for_each_entry_safe(client, next, &adap->client_list, link) {
> +		auxiliary_device_delete(&client->auxdev);
> +		auxiliary_device_uninit(&client->auxdev);
> +
> +		list_del_init(&client->link);
> +		kfree(client);
> +	}
> +
> +	usb_free_urb(adap->rx_urb);
> +
> +	usb_put_intf(adap->intf);
> +
> +	mutex_destroy(&adap->mutex);
> +}

And we execute this. rx_urb is killed and does nothing.
I see nothing that terminates the waiting if you hit the wrong window.
It seems like this needs to complete the waiting.

	Regards
		Oliver
